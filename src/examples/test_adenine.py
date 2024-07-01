#
# test_adenine.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

import unittest
from src.examples.adenine import AdeninePositions
from src.atoms.element import Element
from src.molecules.molecule_representation import MoleculeRepresentation
from src.molecules.molecule_model_utils import molecule_model_from_positions
from tempfile import NamedTemporaryFile


class TestAdeninePositions(unittest.TestCase):

    def test_works(self):
        """We test to make sure the adenine molecule can be represented and model files generated."""
        adenine = AdeninePositions.create_from_pubchem()

        # We expect to have 15 atoms in the adenine molecule.
        self.assertEqual(15, len(adenine.atoms))

        # Test that we can generate the model file representation.
        with NamedTemporaryFile() as scad_file:
            rep = MoleculeRepresentation(adenine)
            model = rep.model()
            model.save_as_scad(scad_file.name)

        # Test that we have the atoms we expect and can generate the model files for the prints.
        molecule = molecule_model_from_positions("adenine", adenine)
        self.assertEqual(5, len(molecule.element_atoms(Element.H)))
        self.assertEqual(5, len(molecule.element_atoms(Element.C)))
        self.assertEqual(5, len(molecule.element_atoms(Element.N)))

        for atom in molecule.atoms():
            with NamedTemporaryFile() as scad_file:
                atom.model().save_as_scad(scad_file.name)
