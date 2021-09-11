/*
 * diatomic_molecule.scad
 *
 * Copyright © 2021 Derek Seiple
 * Licensed under Creative Commons BY-NC-SA 3.0. See license file.
 */

include <../utils/constants.scad>;
use <../atoms/atom.scad>;
use <../atoms/atom_utils.scad>;


/*
 * This will create a Diatomic Molecule (https://en.wikipedia.org/wiki/Diatomic_molecule) which is composed of two
 * elements. This is a utility that other modules can use by filling in the appropriate values for the molecule being
 * formed.
 */
module diatomic_molecule(
  left_radius,  // The radius of the left element
  left_color,   // The color to use for the left element
  right_radius, // The radius of the right element
  right_color,  // The color to use for the right element
  bond_distance // The distance between the center of the two bonded atoms
) {
  left_slice = atom_interface_distance(left_radius, right_radius, bond_distance);
  right_slice = bond_distance - left_slice;

  translate([-left_slice, 0, 0]) {
    rotate([0, 270, 0]) {
      space_filling_atom(left_radius, right_radius, bond_distance, left_color);
    }
  }
  translate([right_slice, 0, 0]) {
    rotate([0, 90, 0]) {    
      space_filling_atom(right_radius, left_radius, bond_distance, right_color);
    }
  }
}


/*
 * Similar to the diatomic_molecule above, this is a diatomic molecule composed of a single element.
 */
module  homonuclear_diatomic_molecule(
  atom_radius,
  bond_distance,
  atom_color
) {
  diatomic_molecule(atom_radius, atom_color, atom_radius, atom_color, bond_distance);
}


/*
 * Since homonuclear molecules have a single element type and therefor all the same color when printed, we can print
 * both atoms at the same time. This can be used by other modules to reduce code duplication.
 */
module homonuclear_diatomic_molecule_print(
  atom_radius,
  bond_distance,
  atom_color
) {
  slice = atom_slice_distance(atom_radius, atom_radius, bond_distance);

  translate([atom_radius + 2, 0, slice]) {
    space_filling_atom(atom_radius, atom_radius, bond_distance, atom_color);
  }
  translate([-(atom_radius + 2), 0, slice]) {
    space_filling_atom(atom_radius, atom_radius, bond_distance, atom_color);
  }
}
