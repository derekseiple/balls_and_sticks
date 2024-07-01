#
# molecule_positions.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

from typing import List, Optional
from src.utils.point import Point
from src.atoms.atom_position import AtomPosition
from src.utils.echeck import echeck
import numpy as np


class MoleculePositions(object):
    """This is a class that represents the positions of the atoms in a molecule in 3D space."""

    def __init__(
        self,
        atoms: List[AtomPosition],
        bond_orders: Optional[np.ndarray] = None,
        labels: Optional[List[str]] = None
    ) -> None:
        """This initializes the MoleculePositions object with the atom positions. And the information about the bonds
        between the atoms. bond_orders is a 2D list where bond_order[i][j] is the bond order between atom i and atom j
        in the atoms list. A value of 0 means no bond between the atoms.
        """
        if bond_orders is None:
            bond_orders = np.zeros((len(atoms), len(atoms)))
        echeck(bond_orders.shape[0] == bond_orders.shape[1], 'The bond order matrix must be square.')
        echeck(len(atoms) == bond_orders.shape[0], 'The number of atoms must match the bond order matrix.')
        if labels is not None:
            echeck(len(labels) == len(atoms), 'If labels are included, they must match the number of atoms.')
        self._atoms = atoms
        self._bond_orders = bond_orders
        self._labels = labels

    @property
    def atoms(self) -> List[AtomPosition]:
        return self._atoms

    @property
    def bond_orders(self) -> np.ndarray:
        return self._bond_orders

    @property
    def labels(self) -> Optional[List[str]]:
        return self._labels

    def translate(self, point: Point) -> None:
        for atom in self._atoms:
            atom.translate(point)

    def rotate_degrees(self, angle: float) -> None:
        for atom in self._atoms:
            atom.rotate_degrees(angle)

    def __iter__(self):
        return iter(self._atoms)
