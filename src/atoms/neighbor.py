#
# neighbor.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

from typing import Optional
from .element import Element
from src.utils.direction import Direction


class Neighbor(object):
    """This is a class that represents a neighbor of an atom."""

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
