include <../utils/constants.scad>;
use <./diatomic_molecule.scad>;


// We use the covalent radius (32pm) and the Van der Waals radius (120pm) in this model
module dihydrogen() {
  hydrogen_radius = 120*pm;
  bond_distance = 2 * 32*pm;
  hydrogen_color = "white";
  homonuclear_diatomic_molecule(hydrogen_radius, bond_distance, hydrogen_color);
}

// The layout to actually print it...
module dihydrogen_print() {
  hydrogen_radius = 120*pm;
  bond_distance = 2 * 32*pm;
  hydrogen_color = "white";
  homonuclear_diatomic_molecule_print(hydrogen_radius, bond_distance, hydrogen_color);
}