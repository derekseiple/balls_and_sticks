/*
 * sodium_chloride.scad
 *
 * Copyright © 2021 Derek Seiple
 * Licensed under Creative Commons BY-NC-SA 3.0. See license file.
 */

include <../utils/constants.scad>;
use <./diatomic_molecule.scad>;
use <../atoms/atom.scad>;


/*
 * This will create a sodium chloride molecule. We use 238.6pm for the bond distance and the Van der Waals radii in this
 * model.
 */
module sodium_chloride() {
  sodium_radius = 227*pm;
  sodium_color = "violet";
  chlorine_radius = 175*pm;
  chlorine_color = "green";
  bond_distance = 238.6*pm;
  diatomic_molecule(sodium_radius, sodium_color, chlorine_radius, chlorine_color, bond_distance);
}


/*
 * This is a convenience function that will print one of the atoms.
 */
module sodium_chloride_print_violet() {
  sodium_radius = 227*pm;
  sodium_color = "violet";
  chlorine_radius = 175*pm;
  bond_distance = 238.6*pm;
  space_filling_atom(sodium_radius, chlorine_radius, bond_distance, sodium_color);
}


/*
 * This is a convenience function that will print one of the atoms.
 */
module sodium_chloride_print_green() {
  sodium_radius = 227*pm;
  chlorine_radius = 175*pm;
  chlorine_color = "green";
  bond_distance = 238.6*pm;
  space_filling_atom(chlorine_radius, sodium_radius, bond_distance, chlorine_color);
}
