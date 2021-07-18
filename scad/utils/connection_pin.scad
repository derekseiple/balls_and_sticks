/*
 * connection_pin.scad
 *
 * Copyright © 2021 Derek Seiple
 * Licensed under Creative Commons BY-NC-SA 3.0. See license file.
 */

include <./constants.scad>;
include <./connection_defaults.scad>;
use <./connection_profile.scad>;

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
  pin_hole_radius = PIN_HOLE_RADIUS                // radius of the inner hole
) {
  assert(pin_hole_radius < connection_radius, "pin_hole_radius must be less than connection_radius.");

  half_pin() {
    pin_profile(connection_height, connection_radius, connection_bump_width, connection_bump_height);
    cylinder(h = INF, r = pin_hole_radius, center = true);
    translate([0, 0, connection_height / 2 + pin_slot_width / 2]) {
      relief_slot(pin_slot_width, connection_height / 2); // TODO Slot tuning
    };
  };
  mirror([0, 0, 1]) {
    half_pin() {
      pin_profile(connection_height, connection_radius, connection_bump_width, connection_bump_height);
      cylinder(h = INF, r = pin_hole_radius, center = true);
      translate([0, 0, connection_height / 2 + pin_slot_width / 2]) {
        relief_slot(pin_slot_width, connection_height / 2);
      };
    };
  }

  // Sub modules below //

  /*
   * Creates the upper half of the pin that will then be mirrored. This expects the profile to be the first module
   * passed in , followed by the hole and slot to be removed.
   */
  module half_pin() {
    difference() {
      rotate_extrude() {
        children(0); // The outer profile
      };
      children(1); // The hole
      children(2); // The slot
    }
  }

  /*
   * We take the connection_profile and modify it slightly for the pin.
   */
  module pin_profile(connection_height, connection_radius, connection_bump_width, connection_bump_height) {
    difference() {
      connection_profile(connection_height, connection_radius, connection_bump_width, connection_bump_height);
      // We remove the top of the profile so the part of the pin that gets inserted is narrower
      translate([0, connection_height - (connection_bump_height / 6), 0]) { // TODO pin width tuning
        square(INF, center = false);
      }
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
