#
# molecule_position_utils.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

from src.molecules.molecule_positions import MoleculePositions
from src.utils.point import Point
from src.atoms.atom_position import AtomPosition
from src.atoms.element import Element
from src.utils.echeck import echeck
from src.utils.constants import pm
import numpy as np


def molecule_position_from_pubchem(json: dict) -> MoleculePositions:
    """This function will take a json object from the PubChem API and return a MoleculePositions object with the
    positions of the atoms in the molecule.

    Args:
        json: The json object from the PubChem API.

    Returns:
        A MoleculePositions object with the positions of the atoms in the molecule.
    """
    elements = json['PC_Compounds'][0]['atoms']['element']
    x_coords = json['PC_Compounds'][0]['coords'][0]['conformers'][0]['x']
    y_coords = json['PC_Compounds'][0]['coords'][0]['conformers'][0]['y']
    if 'z' in json['PC_Compounds'][0]['coords'][0]['conformers'][0]:
        z_coords = json['PC_Compounds'][0]['coords'][0]['conformers'][0]['z']
    else:
        z_coords = [0.0 for _ in x_coords]
    echeck(len(elements) == len(x_coords) == len(y_coords) == len(z_coords),
           'The number of elements, x, y, and z coordinates must be the same.')

    atoms = []
    for element, x, y, z in zip(elements, x_coords, y_coords, z_coords):
        # All of the coordinates appear to be in angstroms, so we need to convert them to pm.
        atoms.append(AtomPosition(Element.from_atomic_number(element), Point(100*x*pm, 100*y*pm, 100*z*pm)))

    # create a map that takes the element position and map it to all the other positions that element has a bond with.
    atom_ids = json['PC_Compounds'][0]['bonds']['aid1']
    mate_ids = json['PC_Compounds'][0]['bonds']['aid2']
    bond_orders = json['PC_Compounds'][0]['bonds']['order']
    echeck(len(atom_ids) == len(mate_ids) == len(bond_orders),
           'The number of atom ids, mate ids, and bond orders must be the same.')

    bonds = np.zeros((len(atoms), len(atoms)))
    for atom_id, mate_id, bond_order in zip(atom_ids, mate_ids, bond_orders):
        bonds[atom_id - 1][mate_id - 1] = bond_order
        bonds[mate_id - 1][atom_id - 1] = bond_order

    return MoleculePositions(atoms, bonds)
