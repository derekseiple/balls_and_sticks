#
# neighbor.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

from typing import Optional
from .element import Element


class Neighbor(object):
    """This is a class that represents a neighbor of an atom."""

    class Direction:
        """This is a class that represents a direction of a neighbor of an atom."""
        def __init__(self, inclination: float, azimuthal: float):
            # inclination angles must lie between -90 and +90 degrees
            if inclination < -90 or inclination > 90:
                raise ValueError(
                    "Inclination angle must be between -90 and +90 degrees, but got: {}".format(inclination))
            # azimuthal angles must lie between -180 and +180 degrees
            if azimuthal < -180 or azimuthal > 180:
                raise ValueError(
                    "Azimuthal angle must be between -180 and +180 degrees, but got: {}".format(azimuthal))
            self._inclination = inclination
            self._azimuthal = azimuthal

        @property
        def inclination(self) -> float:
            return self._inclination

        @property
        def azimuthal(self) -> float:
            return self._azimuthal

    def __init__(
        self,
        element: Element,
        distance: float,
        direction: Direction,
        bond_order: int,
        label: Optional[str] = None,
    ):
        if distance <= 0:
            raise ValueError("Distance must be greater than 0, but got: {}".format(distance))
        self.__element = element
        self.__distance = distance
        self.__direction = direction
        self.__bond_order = bond_order
        self.__label = label

    @property
    def element(self) -> Element:
        return self.__element

    @property
    def distance(self) -> float:
        return self.__distance

    @property
    def direction(self) -> Direction:
        return self.__direction

    @property
    def bond_order(self) -> int:
        return self.__bond_order

    @property
    def label(self) -> Optional[str]:
        return self.__label
