include <../utils/constants.scad>;
use <./diatomic_molecule.scad>;


/*
 * This will create a dihydrogen molecule. We use the covalent radius (32pm) to determine the bond distance and the
 * Van der Waals radius (120pm) in this model.
 */
module dihydrogen() {
  hydrogen_radius = 120*pm;
  bond_distance = 2 * 32*pm;
  hydrogen_color = "white";
  homonuclear_diatomic_molecule(hydrogen_radius, bond_distance, hydrogen_color);
}


/*
 * This is a convenience function that will arrange the two atoms so they can be printed.
 */
module dihydrogen_print() {
  hydrogen_radius = 120*pm;
  bond_distance = 2 * 32*pm;
  hydrogen_color = "white";
  homonuclear_diatomic_molecule_print(hydrogen_radius, bond_distance, hydrogen_color);
}
