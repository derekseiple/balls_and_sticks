/*
 * spherical_cap.scad
 *
 * Copyright © 2022 Derek Seiple
 * Licensed under Creative Commons BY-NC-SA 3.0. See license file.
 */

/*
 * This makes the top half of a sphere with radius r.
 */
module spherical_cap(r) {
  difference() {
    sphere(r = r);
    translate([0, 0, -r]) {
      cube(2 * r, center = true);
    }
  }
}
