#
# print_utils.py
#
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

from math import sqrt, ceil
from typing import List
from src.atoms.atom import AtomModel
from solid2 import cube
from src.molecules.molecule import MoleculeModel


def index_to_2d(index, num_columns):
    """This function takes an index to an array and the number of columns in a grid and returns the row and column of
    that index if the array were to be arranged in a grid.
    """
    row = index // num_columns
    column = index % num_columns
    return (row, column)


def arrange_prints(atoms: List[AtomModel]):
    """This function takes a list of AtomModel objects and arranges them into a grid so that they are not overlapping
    and are not too far apart. This is useful when you have a list of atoms of the same element type and you want to
    print them all at once. It is assumed that the all of the atoms in the list are of the same element type.

    Parameters
    ----------
    atoms : List[AtomModel]
        A list of AtomModel objects to arrange.

    """
    side_len = sqrt(ceil(sqrt(len(atoms))) ** 2)
    radius = atoms[0].element.van_der_waals_radius
    spacing = 2  # 2mm spacing between atoms
    delta = 2 * radius + spacing

    model = cube(0)
    for i, atom in enumerate(atoms):
        row, col = index_to_2d(i, side_len)
        model += atom.print().translate(row * delta, col * delta, 0)

    return model


def print_molecule(molecule: MoleculeModel):  # todo add directory to save to
    """This function takes a MoleculeModel object and produces a collection of scad files. Each scad file will contain
    the 3D model of the molecule with all of the atoms of a particular element type arranged in a grid, so it will
    produce one scad file for each element type in the molecule. The scad files will be named with the format of
    <molecule_name>_<element_name>.scad.
    """
    for element in molecule.elements:
        atoms = molecule.element_atoms(element)
        model = arrange_prints(atoms)
        model.save_as_scad('{}_{}.scad'.format(molecule.name, element.name))
