#
# element.py
#
# Copyright © 2021 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

from enum import Enum
from src.utils.constants import pm


class ElementProperties:
    """Defines general properties of an element.
    """
    def __init__(
        self,
        atomic_number: int,
        symbol: str,
        van_der_waals_radius: float,
        cpk_color: str,
    ):
        self._atomic_number: int = atomic_number
        self._symbol: str = symbol
        self._van_der_waals_radius: float = van_der_waals_radius
        self._cpk_color: str = cpk_color

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


class Element(ElementProperties, Enum):
    """Defines the specific elements of the periodic table."""
    H = 1, 'H', 120*pm, 'white'
    He = 2, 'He', 140*pm, 'cyan'
    Li = 3, 'Li', 182*pm, 'violet'
    Be = 4, 'Be', 153*pm, 'darkgreen'
    B = 5, 'B', 192*pm, 'beige'
    C = 6, 'C', 170*pm, 'black'
    N = 7, 'N', 155*pm, 'blue'
    O = 8, 'O', 152*pm, 'red'  # noqa: E741
    F = 9, 'F', 147*pm, 'green'
    Ne = 10, 'Ne', 154*pm, 'cyan'
    Na = 11, 'Na', 227*pm, 'violet'
    Mg = 12, 'Mg', 173*pm, 'darkgreen'
    Al = 13, 'Al', 184*pm, 'pink'
    Si = 14, 'Si', 210*pm, 'pink'
    P = 15, 'P', 180*pm, 'orange'
    S = 16, 'S', 180*pm, 'yellow'
    Cl = 17, 'Cl', 175*pm, 'green'
    Ar = 18, 'Ar', 188*pm, 'cyan'
    K = 19, 'K', 275*pm, 'violet'
    Ca = 20, 'Ca', 231*pm, 'darkgreen'
