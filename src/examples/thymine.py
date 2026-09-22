#
# thymine.py
#
# Copyright © 2026 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

from typing import List, Optional
from src.atoms.atom_position import AtomPosition
from src.molecules.molecule_positions import MoleculePositions
from pathlib import Path
import json
from src.molecules.molecule_position_utils import molecule_position_from_pubchem
import numpy as np


class ThyminePositions(MoleculePositions):
    """This class represents the locations of the atoms in an adenine molecule: https://en.wikipedia.org/wiki/Thymine
    This class uses the standard numbering, so that N1 is the location of the Nitrogen atom that has the label of 1.
    The numbering starts with the nitrogen atom that will bind to the pentose sugar. The following diagram makes the
    numbering plain:
    https://www.researchgate.net/figure/Chemical-structure-and-atom-numbering-of-thymine-The-positive-end-of-the-molecular_fig3_26858115
    """

    def __init__(
        self,
        atoms: List[AtomPosition],
        bond_orders: np.ndarray,
        labels: Optional[List[str]] = None
    ) -> None:
        """Construct the ThyminePositions object with the given atom positions. This generally should not be used
        directly. Instead, use one of the the create_* methods to create an object.
        """
        super().__init__(atoms, bond_orders, labels)

    @staticmethod
    def create_from_pubchem() -> 'ThyminePositions':
        """This function will create an ThyminePositions object from the PubChem Conformer data located in the data
        directory. It will return the object with the atom positions set.
        """
        path = Path(__file__).resolve().parent.parent / 'data/pubchem/thymine.json'
        with open(path) as f:
            parsed_json = json.load(f)
        positions = molecule_position_from_pubchem(parsed_json)
        # The order of the atoms from PubChem is as follows:
        # [O4, O2, N3, N1, C5, C4, C6, C5*, C2, H6, H3, H1, H5*1, H5*2, H5*3]
        # We know that even though order 1 bonds are present, we remap them to order 2 bonds because they are actually
        # rigid.
        bond_orders = positions.bond_orders
        bond_orders[bond_orders == 1] = 2
        # We label the atoms to make it easier to assemble
        labels = ['O4', 'O2', 'N3', 'N1', 'C5', 'C4', 'C6', 'C5*', 'C2', 'H6', 'H3', 'H1', 'H5*1', 'H5*2', 'H5*3']

        return ThyminePositions(positions.atoms, bond_orders, labels)
