/*
 * water.scad
 *
 * Copyright © 2022 Derek Seiple
 * Licensed under Creative Commons BY-NC-SA 3.0. See license file.
 */

include <../utils/constants.scad>;
include <../atoms/atom_utils.scad>;
use <../atoms/element_properties.scad>;
include <../atoms/elements.scad>;
use <../atoms/atom.scad>;
use <../utils/module_utils.scad>;


/*
 * This will create a water molecule. The bond distance is 95.84pm and the bond angle is 104.45 degrees.
 */
module water() {
  rotate([0, water_bond_angle() / 2, 0]) {
    // Add Oxygen
    space_filling_atom(van_der_waals_radius(O), cpk_color(O), bonds = bonds_for_oxygen());
    // Add Hydrogens
    copy_and_rotate([0, -water_bond_angle(), 0]) {
      offset = -atom_interface_distance(van_der_waals_radius(O), van_der_waals_radius(H), water_bond_distance());
      translate([0, 0, offset]) {
        rotate([180, 0, 0]) {
          space_filling_atom(van_der_waals_radius(H), cpk_color(H), bond = bond_for_hydrogen());
        }
      }
    }
  }
}

/*
 * This is a convenience function that will print just the oxygen atom.
 */
module water_print_oxygen() {
  space_filling_atom(van_der_waals_radius(O), cpk_color(O), bonds = bonds_for_oxygen());
}

/*
 * This is a convenience function that will print just the two hydrogen atoms.
 */
module water_print_hydrogens() {
  translate([-1.25 * van_der_waals_radius(H), 0, 0]) {
    space_filling_atom(van_der_waals_radius(H), cpk_color(H), bond = bond_for_hydrogen());
  }
  translate([1.25 * van_der_waals_radius(H), 0, 0]) {
    space_filling_atom(van_der_waals_radius(H), cpk_color(H), bond = bond_for_hydrogen());
  }
}

// The bond angle between the two hydrogen atoms
function water_bond_angle() = 104.45;

// The bond distance between the oxygen and hydrogen atoms
function water_bond_distance() = 95.84*pm;

// The bond information for the oxygen atom
function bonds_for_oxygen() = [
  [van_der_waals_radius(H), water_bond_distance(), [-90, 0]],
  [van_der_waals_radius(H), water_bond_distance(), [water_bond_angle() - 90, 0]]];

// The bond information for the hydrogen atoms
function bond_for_hydrogen() =
  [van_der_waals_radius(O), water_bond_distance()];
