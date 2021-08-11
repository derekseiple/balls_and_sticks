/*
 * sodium_chloride.scad
 *
 * Copyright © 2021 Derek Seiple
 * Licensed under Creative Commons BY-NC-SA 3.0. See license file.
 */

include <../utils/constants.scad>;
use <../atoms/element_properties.scad>;
include <../atoms/elements.scad>;
use <./diatomic_molecule.scad>;
use <../atoms/atom.scad>;


/*
 * This will create a sodium chloride molecule. We use 238.6pm for the bond distance.
 */
module sodium_chloride() {
  diatomic_molecule(van_der_waals_radius(Na), cpk_color(Na), van_der_waals_radius(Cl), cpk_color(Cl), 238.6*pm);
}


/*
 * This is a convenience function that will print one of the atoms.
 */
module sodium_chloride_print_violet() {
  space_filling_atom(van_der_waals_radius(Na), van_der_waals_radius(Cl), 238.6*pm, cpk_color(Na));
}


/*
 * This is a convenience function that will print one of the atoms.
 */
module sodium_chloride_print_green() {
  space_filling_atom(van_der_waals_radius(Cl), van_der_waals_radius(Na), 238.6*pm, cpk_color(Cl));
}
