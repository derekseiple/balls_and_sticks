#
# neighbor.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

from .element import Element
from .bond import BondModel


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
            # TODO Comment on why we add 90 degrees
            return self._inclination + 90.0

        @property
        def azimuthal(self) -> float:
            return self._azimuthal

    def __init__(
        self,
        element: Element,
        distance: float,
        direction: Direction,
        bond: BondModel,
    ):
        if distance <= 0:
            raise ValueError("Distance must be greater than 0, but got: {}".format(distance))
        self._element = element
        self._distance = distance
        self._direction = direction
        self._bond = bond

    @property
    def element(self) -> Element:
        return self._element

    @property
    def distance(self) -> float:
        return self._distance

    @property
    def direction(self) -> Direction:
        return self._direction

    @property
    def bond(self) -> BondModel:
        return self._bond
