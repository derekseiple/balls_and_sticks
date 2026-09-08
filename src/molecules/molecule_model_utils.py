#
# molecule_model_utils.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

from src.atoms.atom_model import AtomModelBuilder
from src.atoms.neighbor import Neighbor
from src.molecules.molecule_model import MoleculeModel, MoleculeModelBuilder
from src.molecules.molecule_positions import MoleculePositions
from src.molecules.molecule_position_utils import molecule_position_from_pubchem
from pathlib import Path
import json


def molecule_model_from_positions(name: str, positions: MoleculePositions) -> MoleculeModel:
    """This function will use the given MoleculePositions object to create a MoleculeModel object that represents the
    molecule when printed out.
    """
    # While not the most efficient way, we will just loop through all of the atoms in the molecule adding each one as a
    # neighbor or bond and relying on AtomModel to only use the relevant ones.

    molecule = MoleculeModelBuilder(name)
    num_atoms = len(positions.atoms)

    for atom_idx in range(num_atoms):
        atom = AtomModelBuilder(positions.atoms[atom_idx].element)
        for bond_idx in range(num_atoms):
            if bond_idx == atom_idx:
                continue

            direction = (positions.atoms[bond_idx].position - positions.atoms[atom_idx].position)
            if positions.bond_orders[atom_idx][bond_idx] > 0:
                # Add bond
                label = None
                if positions.labels is not None:
                    label = "{}-{}".format(positions.labels[atom_idx], positions.labels[bond_idx])
                atom.add_bond(
                    positions.atoms[bond_idx].element,
                    positions.atoms[atom_idx].position.distance(positions.atoms[bond_idx].position),
                    Neighbor.Direction(direction.get_inclination_angle(), direction.get_azimuthal_angle()),
                    positions.bond_orders[atom_idx][bond_idx],
                    label)
            else:
                # Add neighbor
                atom.add_neighbor(
                    positions.atoms[bond_idx].element,
                    positions.atoms[atom_idx].position.distance(positions.atoms[bond_idx].position),
                    Neighbor.Direction(direction.get_inclination_angle(), direction.get_azimuthal_angle()))

        molecule.add_atom(atom.build())

    return molecule.build()


def molecule_model_from_pubchem(name: str, pubchem: Path) -> MoleculeModel:
    """This function is similar to molecule_model_from_positions, but it will use the PubChem API to get the molecule
    positions instead of requiring a MoleculePositions object. This is useful for molecules that do not need to be altered in any way from
    """
    with open(pubchem) as f:
        parsed_json = json.load(f)
    positions = molecule_position_from_pubchem(parsed_json)
    return molecule_model_from_positions(name, positions)
