#
# atom_model.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

from typing import List, Optional, Tuple
from solid2 import sphere, cube, color
from math import asin, degrees
from src.atoms.element import Element
from src.atoms.neighbor import Neighbor
from src.atoms.bond import bond_model_from_order
from src.utils.direction import Direction
from src.utils.echeck import echeck
from src.utils.point import Point
from src.atoms.atom_utils import SphericalCapData, spherical_cap_is_redundant


class AtomModelBuilder(object):
    """This is a builder class for the AtomModel class. It is used to build an AtomModel object by simply adding a
    list of neighbor atoms along with the distances and orientations of those neighbors. If the neighbor is too far away
    to affect the shape of the atom, then it will not be added to the list of neighbors.
    """

    def __init__(
        self,
        element: Element,
    ):
        self._element = element
        self._neighbors: List[Neighbor] = []

    def _neighbor_changes_atom(self, element: Element, distance: float) -> bool:
        """This method determines if the neighbor will change the shape of the atom. If the distance is greater than the
        sum of the van der Waals radii of the two atoms, then the neighbor will not change the shape of the atom, so it
        doesn't need to be added to the list of neighbors.
        """
        self_r = self._element.van_der_waals_radius
        mate_r = element.van_der_waals_radius
        return distance < self_r + mate_r

    def add_bond(
        self,
        element: Element,
        distance: float,
        direction: Direction,
        bond_order: int,
        label: Optional[str] = None,
    ) -> 'AtomModelBuilder':
        if self._neighbor_changes_atom(element, distance):
            self._neighbors.append(Neighbor(element, distance, direction, bond_order, label))
        return self

    def add_neighbor(
        self,
        element: Element,
        distance: float,
        direction: Direction,
    ) -> 'AtomModelBuilder':
        if self._neighbor_changes_atom(element, distance):
            self._neighbors.append(Neighbor(element, distance, direction, 0))
        return self

    def build(self) -> 'AtomModel':
        return AtomModel(self._element, self._neighbors)


class AtomModel(object):
    """This is a class that represents the model of an atom. It is holds all of the information about neighboring atoms
    and the bonds between them. This is then used to generate the 3D model of the atom by calling the model() method.
    """
    def __init__(
        self,
        element: Element,
        neighbors: List[Neighbor],
    ):
        self._element = element
        # The AtomModelBuilder removes neighbors that are too far away to affect the shape of the atom, but we also need
        # to remove neighbors that are covered by other neighbors. So we check to see if any neighbors are redundant,
        # and if so, we remove them.
        self._neighbors = []
        # The cut plane of a neighbor sits at the atom interface, not at the neighbor's center, so the caps are built
        # from _atom_interface_distance
        spherical_caps = [
            SphericalCapData(
                neighbor.direction,
                self._atom_interface_distance(neighbor.element, neighbor.distance))
            for neighbor in neighbors
        ]
        for i, candidate in enumerate(spherical_caps):
            caps = spherical_caps[:i] + spherical_caps[i + 1:]
            if not spherical_cap_is_redundant(self._element.van_der_waals_radius, candidate, caps):
                self._neighbors.append(neighbors[i])
        echeck(len(self._neighbors) > 0, "Atom model would have no neighbors.")

    @property
    def element(self) -> Element:
        return self._element

    @property
    def neighbors(self) -> List[Neighbor]:
        return self._neighbors

    def clone(self) -> 'AtomModel':
        return AtomModel(self._element, self._neighbors.copy())

    def _atom_interface_distance(
        self,
        mate: Element,
        distance: float,
    ):
        """Given the atomic radii of two atoms (Generally the Van der Waals radius
        https://en.wikipedia.org/wiki/Van_der_Waals_radius) and the distance between the atoms when bonded, this
        computes the distance from the center of the atom to the bottom of the Spherical Cap
        (https://en.wikipedia.org/wiki/Spherical_cap) that we remove so the two mating atoms can sit flush to each
        other.
        """
        self_r = self._element.van_der_waals_radius
        mate_r = mate.van_der_waals_radius
        return ((self_r + mate_r)*(self_r - mate_r) + distance * distance) / (2 * distance)

    def _atom_interface_radius(
        self,
        mate: Element,
        distance: float,
    ):
        """Given the atomic radii of two atoms (Generally the Van der Waals radius
        https://en.wikipedia.org/wiki/Van_der_Waals_radius) and the distance between the atoms when bonded, this
        computes the radius of the circle formed by the intersection of the two atoms. We use this as a gauge to make
        sure that the bond label is not too large for the bond space.
        """
        self_r = self._element.van_der_waals_radius
        mate_r = mate.van_der_waals_radius
        # This uses the stable formula for huron's method to compute the area of a triangle given the three sides.
        # https://en.wikipedia.org/wiki/Heron%27s_formula#Numerical_stability
        sides = [self_r, mate_r, distance]
        sides.sort(reverse=True)
        a = sides[0]
        b = sides[1]
        c = sides[2]
        area = 0.25 * ((a + (b + c)) * (c - (a - b)) * (c + (a - b)) * (a + (b - c))) ** 0.5
        # The intersection radius is the height of that triangle measured from the side joining the two centers.
        return 2 * area / distance

    def _atom_interface_angle(
        self,
        mate: Element,
        distance: float,
    ):
        """When two atoms interface it results in a spherical cap being removed from the atom's sphere. This method
        computest the angle, in degrees, formed between the rays from the center of the sphere to the apex of the cap
        and the edge of the disk forming the base of the cap. This angle can be used to help determine if one spherical
        cap is contained within another.
        """
        return degrees(asin(self._atom_interface_radius(mate, distance) / self._element.van_der_waals_radius))

    @staticmethod
    def _bond_frame_rotations(direction: Direction) -> List[Tuple[float, float, float]]:
        """The rotations, applied in the order given, that carry the space built by _neighbor_space into place on the
        atom. In that local frame the neighbor lies along -z and the key of the bond joint points along +x.

        These rotations only set the inclination and azimuthal angles of the bond and never roll about the bond itself,
        which means the local +x axis lands so that it has the maximum z-component of the direction to the neighbor.
        Both atoms of a bond compute the same vector so the joint keys of the two atoms meet.

        A bond pointing straight up or down has no unique maximum z-component, so we pick one: both keys point along
        world +x. The azimuthal angle of a vertical direction is undefined, so it is ignored, and the atom whose
        neighbor is straight up is rolled 180° to bring its key onto +x as well.
        """
        azimuthal = direction.azimuthal
        roll: List[Tuple[float, float, float]] = []
        if abs(direction.inclination) == 90.0:
            azimuthal = 0.0
            if direction.inclination == 90.0:
                roll = [(0.0, 0.0, 180.0)]
        return roll + [(0.0, -90.0, 0.0), (0.0, -direction.inclination, 0.0), (0.0, 0.0, azimuthal)]

    def _print_neighbor(self) -> Optional[Neighbor]:
        """This method looks at all of the neighbors and returns the one that provides the best surface to print from.
        We want to optimize for the angle of all of the other neighbor surfaces. We don't want any of those neighbor
        surfaces to "overhang" too much as those tend to not print accuratley. So we look at all of the angles formed
        between the neighbors and pick the one where the smallest angle is the largest.

        We only consider bonded neighbors for the print base, but we look at the angles between all of the neighbors to
        find the best one.
        """
        if len(self._neighbors) > 0:
            minimal_angles = [180.0 if neighbor.bond_order > 0 else 0 for neighbor in self._neighbors]
            for i in range(len(self._neighbors)):
                ni = self._neighbors[i]
                pi = Point.create_from_direction_and_distance(ni.direction, ni.distance)
                for j in range(len(self._neighbors)):
                    if i == j:
                        continue
                    nj = self._neighbors[j]
                    pj = Point.create_from_direction_and_distance(nj.direction, nj.distance)
                    minimal_angles[i] = min(minimal_angles[i], Point.angle_between(pi, pj))
            return self._neighbors[minimal_angles.index(max(minimal_angles))]
        return None

    def _neighbor_space(
        self,
        neighbor: Neighbor,
    ):
        """This method returns the space that needs to be removed from the atom in order to make room for the neighbor.
        It is built in the local frame of the bond, so it still has to be rotated by _bond_frame_rotations to point at
        the neighbor.
        """
        self_r = self._element.van_der_waals_radius
        neighbor_space = cube(3 * self_r).translate([-3 * self_r / 2, -3 * self_r / 2, -3 * self_r])
        max_label_radius = self._atom_interface_radius(neighbor.element, neighbor.distance)
        bond_space = bond_model_from_order(neighbor.bond_order, neighbor == self._print_neighbor(), max_label_radius)
        total_space = neighbor_space + bond_space.model(neighbor.label)
        return total_space.down(self._atom_interface_distance(neighbor.element, neighbor.distance))

    def model(self):
        """This method returns the 3D model of the atom. It does this by creating a sphere with the radius of the atom
        and then subtracting the space that is taken up by the neighbors.
        """
        atom = sphere(self._element.van_der_waals_radius)
        for neighbor in self._neighbors:
            # combine the neighbor space and bond space
            to_remove = self._neighbor_space(neighbor)
            # rotate the portion to remove to the correct orientation then subtract it from the atom
            for angles in self._bond_frame_rotations(neighbor.direction):
                to_remove = to_remove.rotate(*angles)
            atom -= to_remove
        return color(self._element.cpk_color)(atom)

    def print(self):
        """This takes the model (from model() call above) and orientates it so that the largest surface area is on the
        x-y plane.
        """
        atom = self.model()
        print_neighbor = self._print_neighbor()
        if print_neighbor is not None:
            atom = atom.rotate(0, 0, -print_neighbor.direction.azimuthal)
            atom = atom.rotate(0, print_neighbor.direction.inclination, 0)
            atom = atom.rotate(0, 90, 0)
            atom = atom.up(self._atom_interface_distance(print_neighbor.element, print_neighbor.distance))
        return atom
