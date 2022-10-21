/*
 * atom.scad
 *
 * Copyright © 2021 Derek Seiple
 * Licensed under Creative Commons BY-NC-SA 3.0. See license file.
 */

include <../utils/constants.scad>;
use <../utils/spherical_cap.scad>;
use <../utils/snap_joint.scad>;
include <../utils/snap_defaults.scad>;
use <../utils/text_utils.scad>;
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
  bond = [],   // A vector of length 2 or 3 that holds the radius of the bonding atom, the bond distance, and optionally
               // a label that will be imbedded in the bond surface respectively.
  bonds = [],  // A vector of bond information. Each bond will be a vector of length 3 or 4 that holds the radius of the
               // bonding atom, the bond distance, and a vector that holds a pair of vales to indicate the direction of
               // the bond (inclination angle and azimuthal angle) respectively. The 4th element is an optional label
               // that will be imbedded in the bond surface.
  neighbors = [] // A vector very similar to bonds, except these are not bonded so they won't get a snap ring geometry.
                 // This is for when an other non-bonding atom is close enough to alter the geometry of this atom.
) {
  assert(len(bond) == 0 || len(bond) == 2 || len(bond) == 3,
         "If bond is provided it must have the bonding radius, bond distance, and an optional label.");

  color(color_name) {
    difference() {
      // We start with the atom then subtract out the mating faces below.
      sphere(r = atom_radius);

      if (len(bond) > 0) {
        assert(bond[0] > 0, "Bond radius must be positive.");
        assert(bond[1] > 0, "Bond distance must be positive.");
        interface_complement(atom_radius, atom_interface_distance(atom_radius, bond[0], bond[1]),
                             len(bond) == 3 ? bond[2] : "");
      };

      union() {
        // Add all of the additional bonds that were given
        for (b = bonds) {
          assert(len(b) == 3 || len(b) == 4,
                 "Bonds malformed. Must contain bonding radius, bond distance, bond direction, and an optional label.");
          assert(b[0] > 0, "All bond radii must be positive.");
          assert(b[1] > 0, "All bond distances must be positive.");
          assert(len(b[2]) == 2, "Bonds malformed. Bond direction must have inclination and azimuthal angle.");
          assert(b[2][0] >= -90 && b[2][0] <= 90,
                 str("All bond inclination angles must lie between -90 and +90, but got ", b[2][0]));
          assert(b[2][1] >= -180 && b[2][1] <= 180,
                 str("All bond azimuthal angles must lie between -180 and +180, but got ", b[2][1]));

          rotate([0, -inclination_angle(b[2][0]), b[2][1]]) {
            interface_complement(atom_radius, atom_interface_distance(atom_radius, b[0], b[1]),
                                 len(b) == 4 ? b[3] : "");
          }
        }

        // Add all of the neighbors that are not bonded
        for (n = neighbors) {
          assert(len(n) == 3, "Neighbors malformed. Must contain neighbor's radius, distance, and direction.");
          assert(n[0] > 0, "All neighbor radii must be positive.");
          assert(n[1] > 0, "All neighbor distances must be positive.");
          assert(len(n[2]) == 2, "Neighbors malformed. Neighbor direction must have inclination and azimuthal angle.");
          assert(n[2][0] >= -90 && n[2][0] <= 90,
                 str("All neighbor inclination angles must lie between -90 and +90, but got ", n[2][0]));
          assert(n[2][1] >= -180 && n[2][1] <= 180,
                 str("All neighbor azimuthal angles must lie between -180 and +180, but got ", n[2][1]));

          rotate([0, -inclination_angle(n[2][0]), n[2][1]]) {
            neighbor_complement(atom_radius, atom_interface_distance(atom_radius, n[0], n[1]));
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
  module interface_complement(atom_radius, interface_distance, label) {
    translate([0, 0, -interface_distance]) {
      translate([0, 0, -2*EPS + SNAP_INDENT]) {
        snap_receiver_compliment();
      }
      translate([0, 0, 4*(SNAP_LIP - EPS) + SNAP_INDENT - EPS]) {
        spherical_cap(r = SNAP_CLEARANCE / 2 + SNAP_RADIUS - SNAP_LIP);
      }
      translate([-3 * atom_radius / 2, -3 * atom_radius / 2, -3 * atom_radius]) {
        cube(3 * atom_radius);
      }
      translate([0, 0, -0.5]) {
        linear_extrude(1) {
          mirror([0, 1, 0]) {
            revolve_text(1.25*SNAP_RADIUS, 4, str(label,label));
          }
        }
      }
    }
  }

  /*
   * Very similar to interface_complement except it does not deal with any snap ring space.
   */
  module neighbor_complement(atom_radius, interface_distance) {
    translate([0, 0, -interface_distance]) {
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
