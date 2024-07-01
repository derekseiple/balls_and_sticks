#
# adenine.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

from typing import List, Optional
from src.atoms.atom_position import AtomPosition
from src.molecules.molecule_positions import MoleculePositions
from pathlib import Path
import json
from src.molecules.molecule_position_utils import molecule_position_from_pubchem
import numpy as np


class AdeninePositions(MoleculePositions):
    """This class represents the locations of the atoms in an adenine molecule: https://en.wikipedia.org/wiki/Adenine
    This class uses the standard numbering, so that N1 is the location of the Nitrogen atom that has the label of 1. In
    addition we also number the Hydrogen atoms to have the same number as the atom it is bound to. For example, the
    hydrogen bound to C2 is labeled as H2. Similarly, the nitrogen atom bound to C6 is labeled as N6, and the hydrogen
    bound to N6 is labeled as H6_1 and H6_2 where H6_1 is the hydrogen atom that is closer to the N1 atom.
    """

    def __init__(
        self,
        atoms: List[AtomPosition],
        bond_orders: np.ndarray,
        labels: Optional[List[str]] = None
    ) -> None:
        """Construct the AdeninePositions object with the given atom positions. This generally should not be used
        directly. Instead, use one of the the create_* methods to create an object.
        """
        super().__init__(atoms, bond_orders, labels)

    @staticmethod
    def create_from_pubchem() -> 'AdeninePositions':
        """This function will create an AdeninePositions object from the PubChem Conformer data located in the data
        directory. It will return the object with the atom positions set.
        """
        path = Path(__file__).resolve().parent.parent / 'data/pubchem/adenine.json'
        with open(path) as f:
            parsed_json = json.load(f)
        positions = molecule_position_from_pubchem(parsed_json)
        # The order of the atoms from PubChem is as follows:
        # [N7, N9, N3, N1, N6, C5, C4, C6, C8, C2, H9, H8, H2, H6_1, H6_2]
        # We know that even though order 1 bonds are present, we remap them to order 2 bonds because they are actually
        # rigid.
        bond_orders = positions.bond_orders
        bond_orders[bond_orders == 1] = 2
        # We label the atoms to make it easier to assemble
        labels = ['N7', 'N9', 'N3', 'N1', 'N6', 'C5', 'C4', 'C6', 'C8', 'C2', 'H9', 'H8', 'H2', 'H6', 'H6']

        return AdeninePositions(positions.atoms, bond_orders, labels)
