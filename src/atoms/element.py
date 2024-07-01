#
# element.py
#
# Copyright © 2021 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

from enum import Enum
from src.utils.constants import pm


class ElementProperties:
    """Defines general properties of an element."""

    def __init__(
        self,
        atomic_number: int,
        symbol: str,
        van_der_waals_radius: float,
        cpk_color: str,
        single_bond_radius: float,
    ):
        self._atomic_number: int = atomic_number
        self._symbol: str = symbol
        self._van_der_waals_radius: float = van_der_waals_radius
        self._cpk_color: str = cpk_color
        self._single_bond_radius: float = single_bond_radius

    def __repr__(self):
        return 'Element({}, {})'.format(self._atomic_number, self._symbol)

    @property
    def atomic_number(self) -> int:
        return self._atomic_number

    @property
    def symbol(self) -> str:
        return self._symbol

    @property
    def van_der_waals_radius(self) -> float:
        return self._van_der_waals_radius

    @property
    def cpk_color(self) -> str:
        return self._cpk_color

    @property
    def single_bond_radius(self) -> float:
        return self._single_bond_radius


class Element(ElementProperties, Enum):
    """Defines the specific elements of the periodic table."""
    H = 1, 'H', 120*pm, 'white', 32*pm
    He = 2, 'He', 140*pm, 'cyan', 46*pm
    Li = 3, 'Li', 182*pm, 'violet', 133*pm
    Be = 4, 'Be', 153*pm, 'darkgreen', 102*pm
    B = 5, 'B', 192*pm, 'beige', 85*pm
    C = 6, 'C', 170*pm, 'dimgray', 75*pm
    N = 7, 'N', 155*pm, 'blue', 71*pm
    O = 8, 'O', 152*pm, 'red', 63*pm  # noqa: E741
    F = 9, 'F', 147*pm, 'green', 64*pm
    Ne = 10, 'Ne', 154*pm, 'cyan', 67*pm
    Na = 11, 'Na', 227*pm, 'violet', 155*pm
    Mg = 12, 'Mg', 173*pm, 'darkgreen', 139*pm
    Al = 13, 'Al', 184*pm, 'pink', 126*pm
    Si = 14, 'Si', 210*pm, 'pink', 116*pm
    P = 15, 'P', 180*pm, 'orange', 111*pm
    S = 16, 'S', 180*pm, 'yellow', 103*pm
    Cl = 17, 'Cl', 175*pm, 'green', 99*pm
    Ar = 18, 'Ar', 188*pm, 'cyan', 96*pm
    K = 19, 'K', 275*pm, 'violet', 196*pm
    Ca = 20, 'Ca', 231*pm, 'darkgreen', 171*pm

    @staticmethod
    def from_atomic_number(atomic: int) -> 'Element':
        """Return the element with the given atomic number."""
        for element in Element:
            if element.atomic_number == atomic:
                return element
        raise ValueError('No element with atomic number {}'.format(atomic))
