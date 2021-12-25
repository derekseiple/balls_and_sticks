/*
 * connection_sleeve_profile.scad
 *
 * Copyright © 2021 Derek Seiple
 * Licensed under Creative Commons BY-NC-SA 3.0. See license file.
 */

include <./constants.scad>;
include <./connection_defaults.scad>;
use <./connection_pin_profile.scad>;


/*
 * This creates the profile of the inner portion of the sleeve that mates with the pin. It uses the same profile
 * used for the pin except it allows for a small space between the two. This is just the 2D profile, the pin will
 * rotationally extrude this.
 */
module connection_sleeve_profile(
    connection_height, connection_radius, connection_bump_width, connection_bump_height, epsilon
) {
  difference() {
    // This creates the rough profile shape with the space. We clean up the edges with the 3 steps below.
    minkowski() {
      connection_pin_profile(connection_height, connection_radius, connection_bump_width, connection_bump_height);
      circle(r = epsilon);
    };
    // clean up the part that spills over into the negative x range (can't rotate extrude otherwise)
    translate([-INF, -INF / 2, 0]) {
      square(size = INF, center = false);
    };
    // Similarly, the bottom edge.
    translate([-INF / 2, -INF, 0]) {
      square(size = INF, center = false);
    };
    // And the top edge.
    translate([-INF / 2, connection_height, 0]) {
      square(size = INF, center = false);
    };
  }
}
