#
# test_molecule_positions.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

import unittest
from src.atoms.atom_position import AtomPosition
from src.atoms.element import Element
from src.molecules.molecule_positions import MoleculePositions
from src.utils.point import Point


class TestMoleculePositions(unittest.TestCase):

    def test_works(self):
        positions = MoleculePositions([
            AtomPosition(Element.H, Point(0.0, 0.0, 0.0)),
            AtomPosition(Element.He, Point(1.0, 0.0, 0.0)),
            AtomPosition(Element.Li, Point(0.0, 1.0, 0.0))])

        # Rotate the molecule. List position should stay the same, but 3D position should change.
        positions.rotate_degrees(90.0)

        self.assertEqual(Element.H, positions.atoms[0].element)
        self.assertEqual(Element.He, positions.atoms[1].element)
        self.assertEqual(Element.Li, positions.atoms[2].element)

        self.assertAlmostEqual(0.0, positions.atoms[0].position.x)
        self.assertAlmostEqual(0.0, positions.atoms[0].position.y)
        self.assertAlmostEqual(0.0, positions.atoms[0].position.z)

        self.assertAlmostEqual(0.0, positions.atoms[1].position.x)
        self.assertAlmostEqual(1.0, positions.atoms[1].position.y)
        self.assertAlmostEqual(0.0, positions.atoms[1].position.z)

        self.assertAlmostEqual(-1.0, positions.atoms[2].position.x)
        self.assertAlmostEqual(0.0, positions.atoms[2].position.y)
        self.assertAlmostEqual(0.0, positions.atoms[2].position.z)

        # Translate the molecule. List position should stay the same, but 3D position should change.
        positions.translate(Point(1.0, 1.0, 1.0))

        self.assertEqual(Element.H, positions.atoms[0].element)
        self.assertEqual(Element.He, positions.atoms[1].element)
        self.assertEqual(Element.Li, positions.atoms[2].element)

        self.assertAlmostEqual(1.0, positions.atoms[0].position.x)
        self.assertAlmostEqual(1.0, positions.atoms[0].position.y)
        self.assertAlmostEqual(1.0, positions.atoms[0].position.z)

        self.assertAlmostEqual(1.0, positions.atoms[1].position.x)
        self.assertAlmostEqual(2.0, positions.atoms[1].position.y)
        self.assertAlmostEqual(1.0, positions.atoms[1].position.z)

        self.assertAlmostEqual(0.0, positions.atoms[2].position.x)
        self.assertAlmostEqual(1.0, positions.atoms[2].position.y)
        self.assertAlmostEqual(1.0, positions.atoms[2].position.z)
