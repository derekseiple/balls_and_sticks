#
# molecule.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

from typing import List, Dict
from src.atoms.element import Element
from src.atoms.atom import AtomModel
import collections


class MoleculeModelBuilder(object):
    """This is a builder class for the MoleculeModel class. It is used to build a MoleculeModel object by adding the
    atoms to the molecule. This is done by using the add_atom method."""
    def __init__(self):
        self._atoms: Dict[Element, List[AtomModel]] = collections.defaultdict(list)

    def add_atom(
        self,
        atom: AtomModel,
    ) -> 'MoleculeModelBuilder':
        """Adds an AtomModel to the molecule. This is used to build the molecule by adding all of the atoms to it."""
        self._atoms[atom.element].append(atom)
        return self

    def build(self) -> 'MoleculeModel':
        return MoleculeModel(self._atoms)


class MoleculeModel(object):
    """This is a class that represents the model of a molecule. It is holds all of the information about the atom models
    in the molecule. This is then used to generate the 3D model of the molecule by calling the atoms() method.
    Note: This does not generate the full 3D model of the molecule itself, but rather the 3D models of the individual
    atoms which, when assembled, will form the 3D model of the molecule."""
    def __init__(
        self,
        atoms: Dict[Element, List[AtomModel]],
    ):
        self._atoms: Dict[Element, List[AtomModel]] = atoms

    @property
    def elements(self) -> List[Element]:
        """Returns a list of all of the types of elements in the molecule. This can be used to iterate over all of the
        atoms of a particular kind in the molecule, by passing the element to the atoms() method."""
        return list(self._atoms.keys())

    def element_atoms(
        self,
        element: Element,
    ) -> List[AtomModel]:
        """Returns a list of all of the atoms in the molecule of the given element type. Since each element type will be
        printed in the same color, then can be used to generate all of the atoms' 3D models for a single print."""
        return self._atoms[element]

    def atoms(
        self,
    ) -> List[AtomModel]:
        """Returns a list of all of the atoms in the molecule. This can be used to generate all of the atoms' 3D models.
        """
        return [atom for atom_list in self._atoms.values() for atom in atom_list]
