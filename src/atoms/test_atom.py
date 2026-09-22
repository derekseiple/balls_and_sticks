#
# test_atom.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

import unittest
from src.atoms.atom_model import AtomModelBuilder
from src.atoms.element import Element
from src.utils.constants import pm
from src.utils.direction import Direction


class TestAtomModel(unittest.TestCase):
    def test_model_runs(self):
        builder = AtomModelBuilder(Element.Na)
        builder.add_neighbor(Element.Cl, 238.6*pm, Direction(45.0, 45.0))
        model = builder.build()
        model.model()
        self.assertTrue(True)
