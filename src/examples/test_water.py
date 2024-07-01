#
# test_water.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

import unittest
from src.molecules.molecule_representation import MoleculeRepresentation
from src.examples.water import WaterPositions
from tempfile import NamedTemporaryFile
from src.molecules.molecule_model_utils import molecule_model_from_positions


class TestWaterModel(unittest.TestCase):

    def test_works(self):
        """We test to make sure the water molecule can be represented and model files generated."""
        positions = WaterPositions.create_from_pubchem()

        # We expect to have 3 atoms in the adenine molecule.
        self.assertEqual(3, len(positions.atoms))

        # Test that we can generate the model file representation.
        with NamedTemporaryFile() as scad_file:
            rep = MoleculeRepresentation(positions)
            model = rep.model()
            model.save_as_scad(scad_file.name)

        # Test that we have the atoms we expect and can generate the model files for the prints.
        molecule = molecule_model_from_positions("adenine", positions)

        for atom in molecule.atoms():
            with NamedTemporaryFile() as scad_file:
                atom.model().save_as_scad(scad_file.name)
