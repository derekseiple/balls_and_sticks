#
# water.py
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


class WaterPositions(MoleculePositions):
    """This class represents the locations of the atoms in a water molecule."""

    def __init__(
        self,
        atoms: List[AtomPosition],
        bond_orders: np.ndarray,
        labels: Optional[List[str]] = None
    ) -> None:
        super().__init__(atoms, bond_orders, labels)

    @staticmethod
    def create_from_pubchem() -> 'WaterPositions':
        """This function will create a WaterPositions object from the PubChem Conformer data located in the data
        directory. It will return the object with the atom positions set.
        """
        path = Path(__file__).resolve().parent.parent / 'data/pubchem/water.json'
        with open(path) as f:
            parsed_json = json.load(f)
        positions = molecule_position_from_pubchem(parsed_json)

        return WaterPositions(positions.atoms, positions.bond_orders)
