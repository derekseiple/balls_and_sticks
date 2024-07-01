#
# test_element.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

import unittest
from src.atoms.element import Element


class TestElement(unittest.TestCase):

    def test_works(self):
        elm = Element.from_atomic_number(1)
        self.assertEqual(1, elm.atomic_number)
        self.assertEqual('H', elm.symbol)
