import unittest
from .atom import AtomModelBuilder
from .element import Element
from .neighbor import Neighbor
from src.utils.constants import pm


class TestAtomModel(unittest.TestCase):
    def test_model_runs(self):
        builder = AtomModelBuilder(Element.Na)
        builder.add_neighbor(Element.Cl, 238.6*pm, Neighbor.Direction(45.0, 45.0))
        model = builder.build()
        model.model()
        self.assertTrue(True)
