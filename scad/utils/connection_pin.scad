/*
 * connection_pin.scad
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
  height = CONNECTION_HEIGHT,           // total height of the pin
  radius = CONNECTION_RADIUS,           // radius of the pin shaft
  bump_width = CONNECTION_BUMP_WIDTH,   // the width of the bump out (from the shaft to outermost point)
  bump_height = CONNECTION_BUMP_HEIGHT, // the total height of the middle bump
  slot_width = CONNECTION_SLOT_WIDTH,   // the width of the slot
  hole_radius = CONNECTION_HOLE_RADIUS  // radius of the inner hole
) {
  assert(hole_radius < radius, "hole_radius must be less than nominal_radius.");

  half_pin() {
    connection_profile(height / 2, radius, bump_width, bump_height);
    cylinder(h = INF, r = hole_radius, center = true);
    translate([0, 0, height / 4 + slot_width / 2]) {
      relief_slot(slot_width, height / 4);
    };
  };
  mirror([0, 0, 1]) {
    half_pin() {
      connection_profile(height / 2, radius, bump_width, bump_height);
      cylinder(h = INF, r = hole_radius, center = true);
      translate([0, 0, height / 4 + slot_width / 2]) {
        relief_slot(slot_width, height / 4);
      };
    };
  }

  // Sub modules below //

  /*
   * Creates the upper half of the pin that will then be mirrored.
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
