include <../utils/constants.scad>;
use <./diatomic_molecule.scad>;
use <../atoms/atom.scad>;



module sodium_chloride() {
  sodium_radius = 227*pm;
  sodium_color = "violet";
  chlorine_radius = 175*pm;
  chlorine_color = "green";
  bond_distance = 238.6*pm;
  diatomic_molecule(sodium_radius, sodium_color, chlorine_radius, chlorine_color, bond_distance);
}

// The layout to actually print it...
module sodium_chloride_print_violet() {
  sodium_radius = 227*pm;
  sodium_color = "violet";
  chlorine_radius = 175*pm;
  bond_distance = 238.6*pm;
  space_filling_atom(sodium_radius, chlorine_radius, bond_distance, sodium_color);
}

module sodium_chloride_print_green() {
  sodium_radius = 227*pm;
  chlorine_radius = 175*pm;
  chlorine_color = "green";
  bond_distance = 238.6*pm;
  space_filling_atom(chlorine_radius, sodium_radius, bond_distance, chlorine_color);
}
