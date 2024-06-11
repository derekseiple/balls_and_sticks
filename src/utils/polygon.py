#
# polygon.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

from typing import List, Optional
from math import atan2
from src.utils.echeck import echeck
from src.utils.point import Point


class ConvexPolygonBuilder:
    """Starts with a single vertex at the origin and builds a convex polygon by adding vertices one at a time. The first
    vertex added will be on the positive x-axis, so it only requires a single distance. Subsequent vertices require a
    distance and an angle. The angle given is the angle formed by the last two vertices and the new vertex.
    """

    def __init__(self):
        self.__vertices: List[Point] = [Point(0.0, 0.0)]

    def __add_first_vertex(self, distance: float) -> None:
        """Add the first vertex other than the one at the origin. This will be on the x-axis."""
        self.__vertices.append(Point(distance, 0.0))

    def __add_subsequent_vertex(self, distance: float, angle: float):
        """Add a vertex that is not the first one. This will use the coordinates of the last two vertices to calculate
        the new vertex given the distance and angle provided."""
        echeck(0 < angle and angle < 180, "Angle must be between 0 and 180 degrees.")

        # To compute the new vertex coordinates, we need to translate the 2nd to last vertex to the origin, rotate the
        # last vertex to the x-axis, find the new vertex, and then rotate and translate it back.
        origin = self.__vertices[0]
        first = self.__vertices[1]
        second_last_vertex = self.__vertices[-2]
        last_vertex = self.__vertices[-1]
        last_vertex_translated = last_vertex - second_last_vertex
        rotation_angle = atan2(last_vertex_translated.y, last_vertex_translated.x)
        last_vertex_magnitude = last_vertex_translated.magnitude()

        new_vertex = Point.construct_from_polar(distance, 180.0 - angle) + Point(last_vertex_magnitude, 0.0)
        new_vertex = new_vertex.rotate_radians(rotation_angle) + second_last_vertex

        # Validate that the new vertex results in a convex polygon.
        # We can check that the angle formed by the origin, new vertex, and last vertex is less than 180 degrees,
        # and that the angle formed by the first vertex, origin, and the new vertex is less than 180 degrees.
        angle = Point.angle_between(origin, new_vertex, last_vertex)
        echeck(
            0 < angle and angle < 180,
            "Adding this vertex would result in a concave polygon. angle_between(origin, new_vertex, last_vertex): {} "
            "distance: {}, angle: {}".format(angle, distance, angle))
        angle = Point.angle_between(first, origin, new_vertex)
        echeck(
            0 < angle and angle < 180,
            "Adding this vertex would result in a concave polygon. angle_between(first, origin, new_vertex) {} "
            "distance: {}, angle: {}".format(angle, distance, angle))

        self.__vertices.append(new_vertex)

    def add_vertex(self, distance: float, angle: Optional[float] = None) -> 'ConvexPolygonBuilder':
        """Add a vertex to the polygon. The distance is the distance from the last vertex added to this one. The angle
        is the angle between the last two vertices and this one. If this is the first vertex added, the angle should be
        None. If this is not the first vertex added, the angle should be provided in degrees.
        """
        echeck(distance > 0, "Distance must be greater than 0.")
        if len(self.__vertices) == 1:
            echeck(angle is None, "First call to add_vertex should not have an angle specified.")
            self.__add_first_vertex(distance)
        else:
            echeck(angle is not None, "Subsequent calls to add_vertex should have an angle specified.")
            assert angle is not None
            self.__add_subsequent_vertex(distance, angle)

        return self

    def build(self) -> 'Polygon':
        """Build the convex polygon from the vertices added so far."""
        echeck(len(self.__vertices) >= 3, "At least 3 vertices are needed to build a polygon.")
        return Polygon(self.__vertices)


class Polygon:
    """This class represents a polygon with a list of vertices. The vertices define the shape of the polygon. While this
    class does not enforce anything about the vertices, the Builder classes should ensure that the vertices are valid
    according to the rules of that builder. For example, the ConvexPolygonBuilder ensures that the vertices used to
    construct the polygon form a convex polygon.
    """

    def __init__(self, vertices: List[Point]):
        self.__vertices = vertices

    @property
    def num_vertices(self):
        return len(self.__vertices)

    @property
    def vertices(self):
        return self.__vertices

    def vertex(self, index: int):
        return self.__vertices[index]
