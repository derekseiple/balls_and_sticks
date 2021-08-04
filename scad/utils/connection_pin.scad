/*
 * connection_pin.scad
 *
 * Copyright © 2021 Derek Seiple
 * Licensed under Creative Commons BY-NC-SA 3.0. See license file.
 */

include <./constants.scad>;
include <./connection_defaults.scad>;
use <./connection_profile.scad>;
use <./module_utils.scad>;

/*
 * This creates a connection pin that will be used to connect the different atoms together. The design aims
 * to be easily printable, easy to pull in and out, but also provide sufficient grip to hold the parts together.
 * The default parameters should be suitable for most cases, but the parameters can be overridden as needed.
 */
module connection_pin(
  connection_height = CONNECTION_HEIGHT,           // height of the connection profile. height of pin is twice this.
  connection_radius = CONNECTION_RADIUS,           // radius of the pin shaft
  connection_bump_width = CONNECTION_BUMP_WIDTH,   // the width of the bump out (from the shaft to outermost point)
  connection_bump_height = CONNECTION_BUMP_HEIGHT, // the total height of the middle bump
  pin_slot_width = PIN_SLOT_WIDTH,                 // the width of the slot
  pin_slot_length_pct = PIN_SLOT_LENGTH_PCT        // specifies the slot length as a percentage of the connection height
) {
  difference() {
    copy_and_mirror([0, 0, 1]) {
      half_pin() {
        connection_profile(connection_height, connection_radius, connection_bump_width, connection_bump_height);
        translate([0, 0, (1 - pin_slot_length_pct) * connection_height + pin_slot_width / 2]) {
          relief_slot(pin_slot_width, pin_slot_length_pct * connection_height);
        };
      };
    };
    // remove two flat sides so we have enough of a surface to adhere to printer bed
    copy_and_mirror([0, 1, 0]) {
      translate([-connection_height, 0.94 * connection_radius, -(3 * connection_height / 2)]) {
        cube(3 * connection_height, center = false);
      };
    };
  }

  // Sub modules below //

  /*
   * Creates the upper half of the pin that will then be mirrored. This expects the profile to be the first module
   * passed in followed by the slot to be removed.
   */
  module half_pin() {
    difference() {
      rotate_extrude() {
        children(0); // The outer profile
      };
      children(1); // The slot
    }
  }

  /*
   * Creates the slot that is removed from both ends.
   */
  module relief_slot(width, length) {
    union() {
      rotate([90, 0, 0]) {
        cylinder(h = INF, r = width / 2, center = true);
      }
      translate([0, 0, length / 2]) {
        cube([width, INF, length], center = true);
      }
    }
  }
}
