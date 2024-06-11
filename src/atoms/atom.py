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
from .bond import BondModel, NoBondModel


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
        bond: BondModel,
        label: Optional[str] = None,
    ) -> 'AtomModelBuilder':
        if self.__neighbor_changes_atom(element, distance):
            self._neighbors.append(Neighbor(element, distance, direction, bond, label))
        return self

    def add_neighbor(
        self,
        element: Element,
        distance: float,
        direction: Neighbor.Direction,
    ) -> 'AtomModelBuilder':
        if self.__neighbor_changes_atom(element, distance):
            self._neighbors.append(Neighbor(element, distance, direction, NoBondModel()))
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

    def __neighbor_space(
        self,
        neighbor: Neighbor,
    ):
        """This method returns the space that needs to be removed from the atom in order to make room for the neighbor.
        """
        self_r = self._element.van_der_waals_radius
        neighbor_space = cube(3 * self_r).translate([-3 * self_r / 2, -3 * self_r / 2, -3 * self_r])
        bond_space = neighbor.bond.model(neighbor.label)
        return (neighbor_space + bond_space).down(self.__atom_interface_distance(neighbor.element, neighbor.distance))

    def model(self):
        """This method returns the 3D model of the atom. It does this by creating a sphere with the radius of the atom
        and then subtracting the space that is taken up by the neighbors.
        """
        atom = sphere(self._element.van_der_waals_radius)
        for neighbor in self._neighbors:
            # combine the neighbor space and bond space
            to_remove = self.__neighbor_space(neighbor)
            # rotate the portion to remove to the correct orientation then subtract it from the atom
            atom -= to_remove.rotate(0, -neighbor.direction.inclination, neighbor.direction.azimuthal)
        # We want to make sure the atom rests on the x-y plane, so we will take the first neighbor and rotate/move the
        # atom so that the neighbor is in the x-y plane.
        if len(self._neighbors) > 0:
            neighbor = self._neighbors[0]
            if neighbor.direction.inclination > -90.0:
                atom = atom.rotate(0, neighbor.direction.inclination, 0)
            atom = atom.up(self.__atom_interface_distance(neighbor.element, neighbor.distance))
        return color(self._element.cpk_color)(atom)
