#
# atom.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

from typing import List, Optional
from solid2 import sphere, cube, color
from .element import Element
from .neighbor import Neighbor
from src.atoms.bond import bond_model_from_order


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

    def __neighbor_changes_atom(self, element: Element, distance: float) -> bool:
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
        direction: Neighbor.Direction,
        bond_order: int,
        label: Optional[str] = None,
    ) -> 'AtomModelBuilder':
        if self.__neighbor_changes_atom(element, distance):
            self._neighbors.append(Neighbor(element, distance, direction, bond_order, label))
        return self

    def add_neighbor(
        self,
        element: Element,
        distance: float,
        direction: Neighbor.Direction,
    ) -> 'AtomModelBuilder':
        if self.__neighbor_changes_atom(element, distance):
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
        self._neighbors = neighbors

    @property
    def element(self) -> Element:
        return self._element

    def clone(self) -> 'AtomModel':
        return AtomModel(self._element, self._neighbors.copy())

    def __atom_interface_distance(
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

    def __atom_interface_radius(
        self,
        mate: Element,
        distance: float,
    ):
        """Given the atomic radii of two atoms (Generally the Van der Waals radius
        https://en.wikipedia.org/wiki/Van_der_Waals_radius) and the distance between the atoms when bonded, this
        computes the radius of the circle formed by the intersection of the two atoms. We use this as a gauge for which
        bonds form the largest surface area between the two atoms, which will make for a good base to print from.
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
        return distance / area / 2

    def __neighbor_space(
        self,
        neighbor: Neighbor,
    ):
        """This method returns the space that needs to be removed from the atom in order to make room for the neighbor.
        """
        self_r = self._element.van_der_waals_radius
        neighbor_space = cube(3 * self_r).translate([-3 * self_r / 2, -3 * self_r / 2, -3 * self_r])
        bond_space = bond_model_from_order(neighbor.bond_order)
        total_space = neighbor_space + bond_space.model(neighbor.label)
        total_space = total_space.down(self.__atom_interface_distance(neighbor.element, neighbor.distance))
        return total_space.rotate(0, -90, 0)

    def model(self):
        """This method returns the 3D model of the atom. It does this by creating a sphere with the radius of the atom
        and then subtracting the space that is taken up by the neighbors.
        """
        atom = sphere(self._element.van_der_waals_radius)
        for neighbor in self._neighbors:
            # combine the neighbor space and bond space
            to_remove = self.__neighbor_space(neighbor)
            # rotate the portion to remove to the correct orientation then subtract it from the atom
            to_remove = to_remove.rotate(0, -neighbor.direction.inclination, 0)
            to_remove = to_remove.rotate(0, 0, neighbor.direction.azimuthal)
            atom -= to_remove
        return color(self._element.cpk_color)(atom)

    def print(self):
        """This takes the model (from model() call above) and orientates it so that the largest surface area is on the
        x-y plane.
        """
        print("Printing atom: {} With {} neighbors:".format(self._element.name, len(self._neighbors)))
        for neighbor in self._neighbors:
            print("  Neighbor: {} with interface radius: {} with bond order: {}".format(
                neighbor.element.name, self.__atom_interface_radius(neighbor.element, neighbor.distance),
                neighbor.bond_order))
        atom = self.model()
        # We want to make sure we have a flat surface to print from, so we want to find the largest surface area formed
        # by the intersection of the atom and its neighbors. We will then rotate/move the atom so that surface is on the
        # x-y plane. But there can be many neighbors, so really we want to limit our search to neighbors that are
        # actually bonded to the atom. So if the bond order is 0, then we make the radius 0 so it doesn't get picked.
        if len(self._neighbors) > 0:
            radii = [
                self.__atom_interface_radius(neighbor.element, neighbor.distance) if neighbor.bond_order > 0 else 0
                for neighbor in self._neighbors]
            neighbor = self._neighbors[radii.index(max(radii))]
            atom = atom.rotate(0, 0, -neighbor.direction.azimuthal)
            atom = atom.rotate(0, neighbor.direction.inclination, 0)
            atom = atom.rotate(0, 90, 0)
            atom = atom.up(self.__atom_interface_distance(neighbor.element, neighbor.distance))
        return atom
