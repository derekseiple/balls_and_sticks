/*
 * connection_pin_profile.scad
 *
 * Copyright © 2021 Derek Seiple
 * Licensed under Creative Commons BY-NC-SA 3.0. See license file.
 */

use <./math_utils.scad>;
use <MCAD/2Dshapes.scad>;

/*
 * This defines the mating profile between the connection pin and the connection sleeve. The connection sleeve has its
 * own profile that is based off of this one. This is just the 2D profile, the pin will rotationally extrude this.
 */
module connection_pin_profile(height, radius, bump_width, bump_height) {

  bump_radius = radius_from_height_and_chord(bump_width, bump_height);

  difference() {
    union() {
      translate([radius + bump_width - bump_radius, 0, 0]) {
        pieSlice(bump_radius, 0, 90);
      }
      square(size = [radius, height], center = false);
      translate([radius + bump_width - bump_radius, height, 0]) {
        pieSlice(bump_radius, 270, 360);
      }
    };
  }
}
