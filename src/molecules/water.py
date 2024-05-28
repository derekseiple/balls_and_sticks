#
# water.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

from src.atoms.element import Element
from src.atoms.atom import AtomModelBuilder
from src.molecules.molecule import MoleculeModel, MoleculeModelBuilder
from src.atoms.bond import SingleBondModel
from src.atoms.neighbor import Neighbor
from src.utils.constants import pm


def water_molecule() -> MoleculeModel:
    """Creates a water molecule model."""
    # The bond angle between the two hydrogen atoms
    bond_angle = 104.45
    # The bond distance between the oxygen and hydrogen atoms
    distance = 95.84*pm

    oxygen = (
        AtomModelBuilder(Element.O)
        .add_bond(Element.H, distance, Neighbor.Direction(-90, 0), SingleBondModel())
        .add_bond(Element.H, distance, Neighbor.Direction(bond_angle - 90, 0), SingleBondModel())
        .build())
    hydrogen = (
        AtomModelBuilder(Element.H)
        .add_bond(Element.O, distance, Neighbor.Direction(0, 0), SingleBondModel())
        .build())

    return (
        MoleculeModelBuilder()
        .add_atom(oxygen)
        .add_atom(hydrogen)
        .add_atom(hydrogen.clone())
        .build())
