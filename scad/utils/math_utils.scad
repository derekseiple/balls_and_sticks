/*
 * math_utils.scad
 *
 * Copyright © 2021 Derek Seiple
 * Licensed under Creative Commons BY-NC-SA 3.0. See license file.
 */

/*
 * Given the chord length and height of a circular segment we compute the radius
 * https://en.wikipedia.org/wiki/Circular_segment#Radius_and_central_angle
 */
function radius_from_height_and_chord(h, c) =
  assert(h > 0, "radius_from_height_and_chord: height must be positive.")
  assert(c > 0, "radius_from_height_and_chord: chord length must be positive.")
  (c * c) / (8 * h) + (h / 2);