#
# molecule_representation.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

from typing import List
from solid2 import sphere, color
from src.atoms.atom_position import AtomPosition


class MoleculeRepresentation(object):
    """This is a class that will generate a representation of a molecule. It is holds all of the atom positions. This is
    then used to generate a 3D model of the molecule by calling the model().

    Note: This does not generate a model that can be 3D printed, rather it generates a basic model for visualizing the
    molecule.
    """

    def __init__(
        self,
        atoms: List[AtomPosition],
    ):
        self._atoms = atoms

    def model(self):
        """This generates a 3D model of the molecule. This is done by creating a sphere for each atom in the molecule
        in the right position and applying the correct color to the sphere based on the element of the atom.
        """
        model = sphere(0)
        for atom in self._atoms:
            model += color(atom.element.cpk_color)(
                sphere(atom.element.van_der_waals_radius).translate(atom.position.x, atom.position.y, atom.position.z))

        return model
