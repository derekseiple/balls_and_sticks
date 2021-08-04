/*
 * atom.scad
 *
 * Copyright © 2021 Derek Seiple
 * Licensed under Creative Commons BY-NC-SA 3.0. See license file.
 */

include <../utils/constants.scad>;
include <../utils/connection_defaults.scad>;
use <../utils/connection_sleeve.scad>;
use <./atom_utils.scad>;

/*
 * Eventually it is intended that this will generate any single atom no matter how many bonds it has or what its
 * bonding configuration is. For now though this just creates an atom with a single bond.
 */
module space_filling_atom(
  atom_radius,   // The radius of the atom we are making (Generally the Van der Waals radius)
  mates_radius,  // The radius of the atom we are bonding to (Generally the Van der Waals radius)
  bond_distance, // The distance between the centers of the two mating atoms (sum of their bond radius)
  color_name     // The color we want the atom to be
) {
  h = atom_slice_distance(atom_radius, mates_radius, bond_distance);

  color(color_name) {
    // After translating and cutting etc bellow we translate back so it is centered at the origin
    translate([0, 0, -h]) {
      difference() {
        // start with the atom. We translate it so that the cut happens on the x-y plane
        translate([0, 0, h]) {
          sphere(r = atom_radius);
        }
        // remove the portion mating with other atom
        translate([-3 * atom_radius / 2, -3 * atom_radius / 2, -3 * atom_radius]) {
          cube(3 * atom_radius);
        };
        // cut out the hole where we will add the connection sleeve
        translate([0, 0, CONNECTION_HEIGHT / 2]){
          cylinder(h = CONNECTION_HEIGHT + CONNECTION_BUMP_HEIGHT,
                   r = CONNECTION_RADIUS + CONNECTION_BUMP_WIDTH + (2 * SLEEVE_CLEARANCE),
                   center = true);
        };
      };
      // We put the sleeve inset from the bottom just slightly to allow for some clearance on the pin bump out.
      translate([0, 0, CONNECTION_BUMP_HEIGHT / 4]) {
        connection_sleeve();
      }
    }
  }
}
