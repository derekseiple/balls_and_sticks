#
# atom_position.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

from src.atoms.element import Element
from src.utils.point import Point


class AtomPosition(object):
    """This is a class that represents the position of an atom in 3D space. It holds the element type and position."""

    def __init__(
        self,
        element: Element,
        position: Point
    ) -> None:
        self._element = element
        self._position = position

    @property
    def element(self) -> Element:
        return self._element

    @property
    def position(self) -> Point:
        return self._position

    def translate(self, point: Point) -> None:
        self._position += point

    def rotate_degrees(self, angle: float) -> None:
        # TODO: fix for 3D
        self._position = self._position.rotate_degrees(angle)
