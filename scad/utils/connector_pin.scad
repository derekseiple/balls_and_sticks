/*
 * connector_pin.scad
 */

use <MCAD/2Dshapes.scad>;

/*
 * This creates a connection pin that will be used to connect the different atoms together. The design aims
 * to be easily printable, easy to pull in and out, but also provide sufficent grip to hold the parts together.
 * The defauult parameters should be suitable for most cases, but the parameter can be overriden as needed.
 */
module connection_pin(
  height = 16,        // total height of the pin
  radius = 2.5,       // radius of the pin shaft
  inner_radius = 1.5, // radius of the inner hole
  bump_width = 0.5,   // the width of the bump out (from the shaft to outermost point)
  bump_height = 1.75, // the total height of the middle bump (from where it first extends beyond the shaft)
  slot_width = 1      // the width of the slot
) {
  assert(inner_radius < radius, "inner_radius must be less than nominal_radius.");

  half_pin(height / 2, radius, inner_radius, bump_width, bump_height, slot_width);
  mirror([0, 0, 1]) {
    half_pin(height / 2, radius, inner_radius, bump_width, bump_height, slot_width);
  }

  // Sub modules below //

  /*
   * Creates the upper half of the pin that will then be mirrored.
   */
  module half_pin(height, radius, inner_radius, bump_width, bump_height, slot_width) {
    difference() {
      rotate_extrude() {
        outer_profile(height, radius, bump_width, bump_height);
      };
      cylinder(h = 3 * height, r1 = inner_radius, r2 = inner_radius, center = true);
      translate([0, 0, height / 2 + slot_width / 2]) {
        relief_slot(slot_width, height / 2, radius + bump_width);
      }
    }
  }

  /*
   * Creates the oouter profile of the pin that can be rotationally extruded.
   */
  module outer_profile(height, radius, bump_width, bump_height) {

    bump_radius = radius_from_height_and_chord(bump_width, bump_height);

    difference() {
      union() {
        translate([radius + bump_width - bump_radius, 0, 0]) {
          pieSlice(bump_radius, 0, 90);
        }
        square(size = [radius, height], center = false);
        translate([radius + bump_width - bump_radius, height + (bump_radius / 2), 0]) {
          pieSlice(bump_radius, 270, 360);
        }
      };
      // We remove this square from the above to clean up the partial bump at the top
      translate([0, height, 0]) {
        square(radius + bump_width, center = false);
      }
    }
  }

  /*
   * Creates the slot that is removed froom both ends.
   */
  module relief_slot(width, length, max_pin_radius) {
    union() {
      rotate([90, 0, 0]) {
        cylinder(h = 2 * max_pin_radius, r1 = width / 2, r2 = width / 2, center = true);
      }
      translate([0, 0, length / 2]) {
        cube([width, 2 * max_pin_radius, length], center = true);
      }
    }
  }

  /*
   * Given the chord length and height of a circular segment we compute the radius
   * https://en.wikipedia.org/wiki/Circular_segment#Radius_and_central_angle
   * TODO: move this to a utility file
   */
  function radius_from_height_and_chord(h, c) =
    assert(h > 0, "radius_from_height_and_chord: height must be positive.")
    assert(c > 0, "radius_from_height_and_chord: chord length must be positive.")
    (c * c) / (8 * h) + (h / 2);
}


// Just hear for testing...
$fa = 1;
$fs = 0.4;
connection_pin();
