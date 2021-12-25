/*
 * connection_sleeve.scad
 *
 * Copyright © 2021 Derek Seiple
 * Licensed under Creative Commons BY-NC-SA 3.0. See license file.
 */

include <./constants.scad>;
include <./connection_defaults.scad>;
use <./connection_sleeve_profile.scad>;

/*
 * This creates a the sleeve geometry that a connection pin will set into. This creates a cylinder and then subtracts
 * out the pin geometry.
 */
module connection_sleeve(
  connection_height = CONNECTION_HEIGHT,           // total height of the connection profile.
  connection_radius = CONNECTION_RADIUS,           // radius of the pin shaft
  connection_bump_width = CONNECTION_BUMP_WIDTH,   // the width of the bump out (from the shaft to outermost point)
  connection_bump_height = CONNECTION_BUMP_HEIGHT, // the total height of the middle bump
  sleeve_radius = SLEEVE_RADIUS,                   // the outside radius of the sleeve
  sleeve_clearance = SLEEVE_CLEARANCE,             // the gap to have between the pin geometry and the sleeve
) {
  assert(connection_radius + connection_bump_width < sleeve_radius, "sleeve_radius must be bigger than pin geometry.");

  difference() {
    translate([0, 0, EPS / 2]) {
      cylinder(h = connection_height - EPS, r = sleeve_radius, center = false);
    };
    rotate_extrude() {
      connection_sleeve_profile(
          connection_height, connection_radius, connection_bump_width, connection_bump_height, sleeve_clearance);
    }
  }
}
