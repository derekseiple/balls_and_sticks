/*
 * dihydrogen.scad
 *
 * Copyright © 2021 Derek Seiple
 * Licensed under Creative Commons BY-NC-SA 3.0. See license file.
 */

include <../utils/constants.scad>;
use <../atoms/element_properties.scad>;
include <../atoms/elements.scad>;
use <./diatomic_molecule.scad>;


/*
 * This will create a dihydrogen molecule. We use 64pm for the bond distance as it is twice the covalent bond radius.
 */
module dihydrogen() {
  homonuclear_diatomic_molecule(van_der_waals_radius(H), 64*pm, cpk_color(H));
}


/*
 * This is a convenience function that will arrange the two atoms so they can be printed.
 */
module dihydrogen_print() {
  homonuclear_diatomic_molecule_print(van_der_waals_radius(H), 64*pm, cpk_color(H));
}
