/*
 * snap_joint.scad
 *
 * Copyright © 2022 Derek Seiple
 * Licensed under Creative Commons BY-NC-SA 3.0. See license file.
 */

include <./constants.scad>;
include <./snap_defaults.scad>;
use <./module_utils.scad>;


/*
 * The will create a snap ring that is used to join components together.
 */
module snap_ring(
  clearance = SNAP_CLEARANCE,
  lip = SNAP_LIP,
  radius = SNAP_RADIUS,
  indent = SNAP_INDENT
) {
  rotate([0, 90, 0]) {
    difference() {
      copy_and_mirror([0, 0, 1]) {
        difference() {
          union() {
            rotate_extrude() {
              translate([radius - (clearance / 2), indent, 0]) {
                polygon(points = [
                  [0, 0], [0 + lip, lip], [0 + lip, 2*lip], [0, 3*lip], [-2, 3*lip], [-2, 0]
                ]);
                translate([-2, -indent]) {
                  square(size = [2, indent], center = false);
                }
              }
            };
            translate([0,0,0.5]) {
              cylinder(h = 1, r = 1.25, center = true);
            };
          }
          translate([0,0,1.75]) {
            cube(size = [3*radius, radius + lip - 2, radius + lip - 2], center = true);
          }
        }
      };
      translate([radius - (clearance / 2) - EPS, -3 * radius / 2, -3 * radius / 2]) {
        cube(3 * radius);
      }
    }
  }
}

/*
 * This defines the space that the snap ring fits into. This isn't used directly, but is used in the
 * snap_receiver_compliment below which is used in the space_filling_atom module.
 */
module snap_receiver(
  clearance = SNAP_CLEARANCE,
  lip = SNAP_LIP,
  radius = SNAP_RADIUS,
  indent = SNAP_INDENT
) {
  rotate_extrude() {
    translate([radius + (clearance / 2), 0, 0]) {
      polygon(points = [
        [0, 0], [lip, lip], [lip, 2*lip], [-lip, 4*lip], [1, 4*lip], [1, 0]
      ]);
      translate([0, -indent]) {
        square(size = [1, indent], center = false);
      }
    }
  }
}

/*
 * This defines the compliment of the space that the snap ring fits into.
 */
module snap_receiver_compliment(
  clearance = SNAP_CLEARANCE,
  lip = SNAP_LIP,
  radius = SNAP_RADIUS,
  indent = SNAP_INDENT
) {
  difference() {
    translate([0, 0, EPS/2 - indent]) {
      cylinder(h = 4 * lip + indent - EPS, r = radius + (clearance/2) + lip, center = false);
    }
    snap_receiver(clearance, lip, radius, indent);
  }
}
