#
# atom_utils.py
#
# Copyright © 2026 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

from itertools import combinations
from src.utils.direction import Direction
from src.utils.point import Point
from typing import Iterator, List
from src.utils.echeck import echeck
import numpy as np


class SphericalCapData:
    """This just holds the information needed to define a spherical cap, namely we can define a spherical cap by a
    direction and a distance from the center of the sphere.

    The distance is signed. A negative distance puts the cut plane behind the center of the sphere, which means the cap
    covers more than a hemisphere. The unit vector always points along the direction regardless of that sign.
    """
    def __init__(self, direction: Direction, distance: float):
        self._direction = direction
        self._distance = distance
        self._unit_vector = Point.create_from_direction_and_distance(direction, 1.0)

    @property
    def direction(self) -> Direction:
        return self._direction

    @property
    def distance(self) -> float:
        return self._distance

    @property
    def unit_vector(self) -> Point:
        """This returns the vector (Point) that points in the direction of the spherical cap but is normalized to have
        a length of 1.
        """
        return self._unit_vector


def intersection_of_plane_triples(caps: List[SphericalCapData]) -> List[Point]:
    """This function returns the intersection of 3 cut planes defined by the caps. We do this by solving the system of
    equations defined by the 3 cut planes from the 3 caps.
    """
    echeck(len(caps) == 3, "There must be exactly 3 caps to intersect.")
    A = np.array([
        [caps[0].unit_vector.x, caps[0].unit_vector.y, caps[0].unit_vector.z],
        [caps[1].unit_vector.x, caps[1].unit_vector.y, caps[1].unit_vector.z],
        [caps[2].unit_vector.x, caps[2].unit_vector.y, caps[2].unit_vector.z],
    ], dtype=float)
    b = np.array([
        caps[0].distance,
        caps[1].distance,
        caps[2].distance,
    ], dtype=float)
    try:
        x = np.linalg.solve(A, b)
        return [Point(x[0], x[1], x[2])]
    except Exception:
        return []


def intersection_of_plane_pairs(radius: float, caps: List[SphericalCapData], eps: float = 1e-9) -> List[Point]:
    """This function returns the intersection of 2 cut planes defined by the caps. We do this by solving the system of
    equations defined by the 2 cut planes from the 2 caps. We then take only the points that are on the surface of the
    sphere with radius radius.
    """
    echeck(len(caps) == 2, "There must be exactly 2 caps to intersect.")
    u1 = np.array([caps[0].unit_vector.x, caps[0].unit_vector.y, caps[0].unit_vector.z])
    u2 = np.array([caps[1].unit_vector.x, caps[1].unit_vector.y, caps[1].unit_vector.z])

    v = np.cross(u1, u2)
    vnorm = np.linalg.norm(v)
    if vnorm < eps:
        # Parallel (or nearly parallel) planes, no intersection
        return []
    v /= vnorm

    # Find the closest point on the intersection line to the origin.
    A = np.array([u1, u2])
    b = np.array([caps[0].distance, caps[1].distance])
    closet_p = A.T @ np.linalg.solve(A @ A.T, b)
    p = Point(closet_p[0], closet_p[1], closet_p[2])
    p_magnitude = p.magnitude()

    # If p is not within the sphere, or on the surface of the sphere, return an empty list.
    if p_magnitude >= radius:
        return []

    # Now find the delta that gets +/- from p on the intersection line that is on the surface of the sphere.
    d = np.sqrt(radius * radius - p_magnitude * p_magnitude) * v
    delta = Point(d[0], d[1], d[2])
    return [p + delta, p - delta]


def singal_plane_max_point(
    radius: float,
    candidate: SphericalCapData,
    cap: SphericalCapData,
    eps: float = 1e-9
) -> List[Point]:
    """ Given a sphere with radius, and the spherical cap, cap, they intersect at a circle along the boundary of the
    sphere. This function finds the point on that circle that has the maximal component in the direction of the
    candidate spherical cap. This point is where candidate.unit_vector dot X is maximal for X on the circle.
    """
    if abs(cap.distance) >= radius:
        return []

    # Get the center of the circle and the radius of the circle, rho
    center = cap.unit_vector.scale(cap.distance)
    rho = np.sqrt(radius * radius - cap.distance * cap.distance)

    # Get the component of the candidate unit vector in the direction of the cap unit vector. This is the direction we
    # must go to get to the max point. If the candidate is parallel to the cap, every point on the circle has the same
    # component, so any point on the circle is a valid extreme.
    v = candidate.unit_vector - cap.unit_vector.scale(candidate.unit_vector.dot(cap.unit_vector))
    if v.magnitude() < eps:
        # Any direction in the plane of the circle works; cross the normal with an axis it is not along.
        axis = Point(1.0, 0.0, 0.0) if abs(cap.unit_vector.x) < 0.9 else Point(0.0, 1.0, 0.0)
        v = cap.unit_vector.cross(axis)
    v_norm = v.scale(1.0 / v.magnitude())

    # now the candidate point is just moving from the center of the circle in the direction of v_norm by rho.
    return [center + v_norm.scale(rho)]


def point_in_cut_sphere(radius: float, point: Point, caps: List[SphericalCapData], eps: float = 1e-9) -> bool:
    """This function checks if a point is in the space R, that is left when all of the caps are cut away from the
    sphere. To be in that space the point must satisfy the following conditions:
    * point.magnitude() <= radius
    * point.dot(caps[i].unit_vector) <= caps[i].distance for all i in [1, 2, ..., n]
    """
    if point.magnitude() > radius + eps:
        return False
    return all(point.dot(cap.unit_vector) <= cap.distance + eps for cap in caps)


def point_in_spherical_cap(radius: float, point: Point, cap: SphericalCapData, eps: float = 1e-9) -> bool:
    """This function checks if a point is in a spherical cap. To be in the cap the point must satisfy the following
    conditions:
    * point.magnitude() <= radius
    * point.dot(cap.unit_vector) >= cap.distance
    """
    return point.magnitude() <= radius + eps and point.dot(cap.unit_vector) >= cap.distance - eps


def cut_sphere_candidate_points(
    radius: float,
    candidate: SphericalCapData,
    caps: List[SphericalCapData],
) -> Iterator[Point]:
    """Yields the boundary points that can witness whether the candidate cap meets the remaining region R.

    The points come from, in order:
    * The apex of the candidate cap, which is where candidate.unit_vector is maximal over all of S
    * Intersection of all triples of cut planes
    * Intersection of all pairs of cut planes with the sphere
    * The point on each cut-plane/sphere circle that maximizes candidate.unit_vector
    """
    yield candidate.unit_vector.scale(radius)
    for triple in combinations(caps, 3):
        yield from intersection_of_plane_triples(list(triple))
    for pair in combinations(caps, 2):
        yield from intersection_of_plane_pairs(radius, list(pair))
    for cap in caps:
        yield from singal_plane_max_point(radius, candidate, cap)


def spherical_cap_is_redundant(radius: float, candidate: SphericalCapData, caps: List[SphericalCapData]) -> bool:
    """Given a sphere with radius, and a collection of spherical caps that are cut away from the sphere, not all of the
    spherical caps necessarily contribute to the overal resulting geometry. Some of the spherical caps may be redundant,
    in the sense that they are contained within other spherical caps. This function checks if the candidate spherical
    cap is redundant relative the the list of other caps.

    To make this determination, we first define the following:
    * S = the sphere with radius radius. We define it as
        S = { x | norm(x) <= radius }
    * C_i = the ith spherical cap in the caps list. We define it as
        C_i = { x | x is in S, x dot caps[i].unit_vector >= caps[i].distance }
    * C_candidate = the candidate spherical cap. We define it as
        C_candidate = { x | x is in S, x dot candidate.unit_vector >= candidate.distance }
    * R = the region of the sphere that is left after all of the caps are cut away from the sphere.
        R = S - (C_1 union C_2 union ... union C_n) or equivalently
        R = { x | x is in S, x dot caps[j].unit_vector < caps[j].distance for all j in [1, 2, ..., n] }
    * P_i = the cap's cut plane defined by
        P_i = { x | x dot caps[i].unit_vector == caps[i].distance }

    With these definitions, we can say that the candidate spherical cap is redundant if and only if
    C_candidate intersect R is empty, or we can say C_candidate is necessary if we can find in R that is in C_candidate.

    Since R is convex, we only need to check boundary points of R to determine if C_candidate is necessary. We can
    generate candidate points of R in the following ways:
    * The apex of C_candidate, radius * candidate.unit_vector. This is the point of S where the candidate direction is
      maximal, so when no other cap has cut it away the candidate is doing work no other cap does.
    * Intersection of all triples of cut planes (P_i intersect P_j intersect P_k)
    * Intersection of all pairs of cut planes on the boundary of S
    * The point on the circle defined by the intersection of a cut plane and the sphere S that has the maximal component
      in the C_candidate.unit_vector direction.

    These are just candidate points of R, we still need to check that they are in R before using them to determine if
    C_candidate is necessary.
    """
    if not caps:
        return candidate.distance >= radius
    for point in cut_sphere_candidate_points(radius, candidate, caps):
        if point_in_cut_sphere(radius, point, caps) and point_in_spherical_cap(radius, point, candidate):
            return False
    return True
