#
# print_utils.py
#
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

from math import sqrt, ceil
from pathlib import Path
from typing import List
from src.atoms.atom_model import AtomModel
from solid2 import cube
from src.molecules.molecule_model import MoleculeModel
from src.utils.glue_joint import GlueJoint
from src.utils.snap_joint import SnapJoint


def index_to_2d(index, num_columns):
    """This function takes an index to an array and the number of columns in a grid and returns the row and column of
    that index if the array were to be arranged in a grid.
    """
    row = index // num_columns
    column = index % num_columns
    return (row, column)


def arrange_parts(parts, radius: float):
    """Arrange a list of solid2 models into a square-ish grid. Each part is treated as occupying a circle of the given
    radius, and a 2mm gap is left between neighbors.
    """
    if not parts:
        return cube(0)
    side_len = sqrt(ceil(sqrt(len(parts))) ** 2)
    spacing = 2  # 2mm spacing between parts
    delta = 2 * radius + spacing
    model = cube(0)
    for i, part in enumerate(parts):
        row, col = index_to_2d(i, side_len)
        model += part.translate(row * delta, col * delta, 0)
    return model


def arrange_atoms(atoms: List[AtomModel]):
    """This function takes a list of AtomModel objects and arranges them into a grid so that they are not overlapping
    and are not too far apart. This is useful when you have a list of atoms of the same element type and you want to
    print them all at once. It is assumed that the all of the atoms in the list are of the same element type.

    Parameters
    ----------
    atoms : List[AtomModel]
        A list of AtomModel objects to arrange.
    """
    return arrange_parts([atom.print() for atom in atoms], atoms[0].element.van_der_waals_radius)


def arrange_snap_joints(n_snap: int):
    """Arrange a list of snap joints into a grid so that they are not overlapping and are not too far apart.
    """
    return arrange_parts([SnapJoint().ring_model() for _ in range(n_snap)], 6)


def arrange_glue_joints(n_glue: int):
    """Arrange a list of glue joints into a grid so that they are not overlapping and are not too far apart.
    """
    return arrange_parts([GlueJoint().ring_model() for _ in range(n_glue)], 6)


def snap_joint_count(molecule: MoleculeModel) -> int:
    """Count the number of snap joints in the molecule. This will double-count each bond, so the result should be
    divided by 2.
    """
    return sum(1 for atom in molecule.atoms() for neighbor in atom.neighbors if neighbor.bond_order == 1) // 2


def glue_joint_count(molecule: MoleculeModel) -> int:
    """Count the number of glue joints in the molecule. This will double-count each bond, so the result should be
    divided by 2.
    """
    return sum(1 for atom in molecule.atoms() for neighbor in atom.neighbors if neighbor.bond_order in (2, 3)) // 2


def print_molecule(molecule: MoleculeModel, directory: Path = Path('.')):
    """This function takes a MoleculeModel object and produces a collection of scad files. Each scad file will contain
    the 3D model of the molecule with all of the atoms of a particular element type arranged in a grid, so it will
    produce one scad file for each element type in the molecule. The scad files will be named with the format of
    <molecule_name>_<element_name>.scad and written into the given directory. If there are snap joints or glue joints,
    for the molucule then a <molecule_name>_snap_joints.scad and <molecule_name>_glue_joints.scad file is also written,
    with one printable snap or glue joint for each bond in the molecule.

    Parameters
    ----------
    molecule : MoleculeModel
        The molecule to produce print files for.

    directory : Path
        The directory to write the scad files into. It will be created if it does not already exist.
    """
    directory.mkdir(parents=True, exist_ok=True)
    for element in molecule.elements:
        atoms = molecule.element_atoms(element)
        arrange_atoms(atoms).save_as_scad(directory / f'{molecule.name}_{element.name}.scad')
    snap_count = snap_joint_count(molecule)
    if snap_count > 0:
        arrange_snap_joints(snap_count).save_as_scad(directory / f'{molecule.name}_snap_joints.scad')
    glue_count = glue_joint_count(molecule)
    if glue_count > 0:
        arrange_glue_joints(glue_count).save_as_scad(directory / f'{molecule.name}_glue_joints.scad')
