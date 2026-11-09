# Modules and Functions

There are several modules and functions that have been created to make it easier to piece together multiple components.
We describe here how the user can interact with these modules. While this list is not exhaustive, we aim to document the
main features available.

* [Working With the Atomic Scale](#working-with-the-atomic-scale)
* [Elements and Element Properties](#elements-and-element-properties)
* [Generating Molecule Models](#generating-molecule-models)

## Working With the Atomic Scale

The natural unit to use when working on the atomic scale is the picometer, but we also have to create the atoms and
molecules at a scale that allows us to 3D print them. Part of the constraint on size is being able to print the
snap rings that join multiple atoms together. Therefore we define a scale so that we can specify dimensions in
picometers. We call the scaling constant `pm`. So if we want something to be 100 picometers we can specify it as
`100*pm`.

This scaling factor is defined in `src/utils/constants.py`. It is chosen so that the van der Waals radius of hydrogen
is 10 mm in print units:

```
120 * pm == 10
```

so `pm = 1/12`. Distances from chemistry sources that are given in ångströms convert as `100 * x * pm`, which is how
PubChem coordinates are loaded.

## Elements and Element Properties

Atomic properties live on the `Element` enum in `src/atoms/element.py`. Each entry is also an `ElementProperties`
object, so you can ask an element for its atomic number, symbol, van der Waals radius, CPK color, and covalent
single-bond radius.

```python
from src.atoms.element import Element

Element.H.symbol                 # 'H'
Element.H.atomic_number          # 1
Element.H.van_der_waals_radius   # 120 * pm  (10 mm)
Element.H.cpk_color              # 'white'
Element.H.single_bond_radius     # 32 * pm
```

`Element.from_atomic_number(1)` looks an element up by atomic number, which is what the PubChem importer uses.

The table currently covers hydrogen through calcium:

| Symbol | Atomic number | van der Waals radius | CPK color | Single-bond radius |
| ------ | ------------- | -------------------- | --------- | ------------------ |
| H      | 1             | 120 pm               | white     | 32 pm              |
| He     | 2             | 140 pm               | cyan      | 46 pm              |
| Li     | 3             | 182 pm               | violet    | 133 pm             |
| Be     | 4             | 153 pm               | darkgreen | 102 pm             |
| B      | 5             | 192 pm               | beige     | 85 pm              |
| C      | 6             | 170 pm               | dimgray   | 75 pm              |
| N      | 7             | 155 pm               | blue      | 71 pm              |
| O      | 8             | 152 pm               | red       | 63 pm              |
| F      | 9             | 147 pm               | green     | 64 pm              |
| Ne     | 10            | 154 pm               | cyan      | 67 pm              |
| Na     | 11            | 227 pm               | violet    | 155 pm             |
| Mg     | 12            | 173 pm               | darkgreen | 139 pm             |
| Al     | 13            | 184 pm               | pink      | 126 pm             |
| Si     | 14            | 210 pm               | pink      | 116 pm             |
| P      | 15            | 180 pm               | orange    | 111 pm             |
| S      | 16            | 180 pm               | yellow    | 103 pm             |
| Cl     | 17            | 175 pm               | green     | 99 pm              |
| Ar     | 18            | 188 pm               | cyan      | 96 pm              |
| K      | 19            | 275 pm               | violet    | 196 pm             |
| Ca     | 20            | 231 pm               | darkgreen | 171 pm             |

## Generating Molecule Models

Printable atoms are not authored by placing spheres by hand. You describe where the atoms sit in space, then convert
that description into a collection of per-atom OpenSCAD models.

### Positions: `AtomPosition` and `MoleculePositions`

An `AtomPosition` (`src/atoms/atom_position.py`) is one atom in the molecule: an `Element` and a `Point` in print
units.

A `MoleculePositions` object (`src/molecules/molecule_positions.py`) holds:

* `atoms`: the list of `AtomPosition`s
* `bond_orders`: a square matrix where `bond_orders[i][j]` is the bond order between atom `i` and atom `j` (0 means no
  bond)
* `labels`: an optional name per atom, used later on the printed mating faces (for example `C4` and `C5` become the
  face label `C4-C5`)

You can build this by hand, subclass it as the examples do (`WaterPositions`, `AdeninePositions`), or parse a PubChem
JSON conformer with `molecule_position_from_pubchem` in `src/molecules/molecule_position_utils.py`.

### Models: `AtomModel` and `MoleculeModel`

`molecule_model_from_positions(name, positions)` in `src/molecules/molecule_model_utils.py` turns positions into a
`MoleculeModel`. For each atom it constructs an `AtomModelBuilder` and walks every other atom:

* If `bond_orders[i][j] > 0`, it calls `add_bond` with the center-to-center distance, a `Direction` (inclination from
  the xy-plane and azimuthal angle from +x), the bond order, and an optional face label.
* Otherwise it calls `add_neighbor` with the same geometry. Unbonded neighbors still flatten the van der Waals sphere
  when they overlap.

`AtomModelBuilder` drops any neighbor farther than the sum of the two van der Waals radii, since those do not change
the printed shape. `AtomModel` then drops geometrically redundant cuts: a neighbor whose spherical cap is already
covered by the union of the others.

Bond order chooses the joint that is subtracted from the mating face:

* order 1: a snap joint (printable ring)
* order 2 or 3: a glue joint (filament pin holes)
* order 0: a planar cut only

The resulting `MoleculeModel` does not emit one fused solid. It groups `AtomModel`s by element so each color can be
printed separately. `atom.model()` is the atom in its molecular orientation; `atom.print()` rotates it so a bonded
face sits on the xy-plane for printing. `print_molecule` in `src/utils/print_utils.py` writes one `.scad` file per
element, plus snap rings when any order-1 bonds exist.

If the PubChem geometry is already what you want, `molecule_model_from_pubchem(name, path)` loads the JSON and runs
the same conversion.

```python
from pathlib import Path
from src.examples.adenine import AdeninePositions
from src.molecules.molecule_model_utils import molecule_model_from_positions
from src.utils.print_utils import print_molecule

adenine = AdeninePositions.create_from_pubchem()
molecule = molecule_model_from_positions("adenine", adenine)
print_molecule(molecule, Path("prints/adenine"))
```
