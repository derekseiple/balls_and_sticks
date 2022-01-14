/*
 * atom.scad
 *
 * Copyright © 2021 Derek Seiple
 * Licensed under Creative Commons BY-NC-SA 3.0. See license file.
 */

include <../utils/constants.scad>;
include <../utils/connection_defaults.scad>;
use <../utils/connection_sleeve.scad>;
use <../utils/connection_sleeve_profile.scad>;
use <../utils/spherical_cap.scad>;
use <./atom_utils.scad>;

/*
 * This will create a space filling atom with one or more bonds. You can specify a single bond (via bond) which will be
 * placed at the bottom (-z direction) of the atom, or if multiple bonds are needed you can supply those (via bonds)
 * which also expects rotation information. This will take the collective sum of bond and bonds as the interfaces to
 * create. It is up to the user to ensure each interface does not interfere with the others.
 */
module space_filling_atom(
  atom_radius, // The radius of the atom we are making (Generally the Van der Waals radius)
  color_name,  // The color we want the atom to be
  bond = [],   // A vector of length 2 that holds the radius of the bonding atom ((Generally the Van der Waals radius)
               // and the bond distance respectively.
  bonds = []   // A vector of bond information. Each bond will be a vector of length 3 that holds the radius of the
               // bonding atom, the bond distance, and a vector that holds a pair of vales to indicate the direction of
               // the bond (inclination angle and azimuthal angle respectively).
) {
  assert(len(bond) == 0 || len(bond) == 2,
         "If bond is provided it must have exactly 2 elements, the bonding radius and bond distance.")

  color(color_name) {
    difference() {
      // We start with the atom then subtract out the mating faces below.
      sphere(r = atom_radius);

      if (len(bond) == 2) {
        assert(bond[0] > 0, "Bond radius must be positive.");
        assert(bond[1] > 0, "Bond distance must be positive.");
        interface_complement(atom_radius, atom_interface_distance(atom_radius, bond[0], bond[1]));
      };

      union() {
        // Add all of the additional bonds that were given
        for (b = bonds) {
          assert(len(b) == 3, "Bonds malformed. Must contain bonding radius, bond distance, and bond direction.")
          assert(b[0] > 0, "All bond radii must be positive.");
          assert(b[1] > 0, "All bond distances must be positive.");
          assert(len(b[2]) == 2, "Bonds malformed. Bond direction must have inclination and azimuthal angle.")
          assert(b[2][0] >= -90 && b[2][0] <= 90, "All bond inclination angles must lie between -90 and +90.")
          assert(b[2][1] >= -180 && b[2][1] <= 180, "All bond azimuthal angles must lie between -180 and +180.")

          rotate([0, -inclination_angle(b[2][0]), b[2][1]]) {
            interface_complement(atom_radius, atom_interface_distance(atom_radius, b[0], b[1]));
          }
        }
      };
    }
  }

  // Sub modules below //

  /*
   * This creates the complimentary space that when subtracted leaves the atom with a face removed from it. This always
   * cuts the interface along the bottom of the atom (-z direction). To add multiple interfaces you can rotate the atom
   * before subtracting away this mating interface.
   */
  module interface_complement(atom_radius, interface_distance) {
    translate([0, 0, -interface_distance]) {
      translate([0, 0, CONNECTION_BUMP_WIDTH / 4]) {
        rotate_extrude() {
          connection_sleeve_profile(
            connection_height = CONNECTION_HEIGHT,
            connection_radius = CONNECTION_RADIUS,
            connection_bump_width = CONNECTION_BUMP_WIDTH,
            connection_bump_height = CONNECTION_BUMP_HEIGHT,
            epsilon = SLEEVE_CLEARANCE);
        }
      }
      // We inset the connection sleeve just slightly to allow for better clearance.
      cylinder(h = CONNECTION_BUMP_WIDTH / 2 + EPS,
               r = CONNECTION_RADIUS + CONNECTION_BUMP_WIDTH + SLEEVE_CLEARANCE,
               center = true);
      // We also allow some extra space inside the atom so we don't get some interference with the pin.
      translate([0, 0, CONNECTION_HEIGHT + (CONNECTION_BUMP_WIDTH / 4) - EPS]) {
        cylinder(h = CONNECTION_BUMP_WIDTH / 2,
                 r = CONNECTION_RADIUS + CONNECTION_BUMP_WIDTH + SLEEVE_CLEARANCE,
                 center = false);
        spherical_cap(r = CONNECTION_RADIUS + CONNECTION_BUMP_WIDTH + SLEEVE_CLEARANCE);
      }
      translate([-3 * atom_radius / 2, -3 * atom_radius / 2, -3 * atom_radius]) {
        cube(3 * atom_radius);
      }
    }
  }

  /*
   * This converts the input inclination angle to the one needed that will work with the interface_complement module.
   */
  function inclination_angle(inclination) =
    inclination + 90;
}
