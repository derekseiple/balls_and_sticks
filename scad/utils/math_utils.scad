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

/*
 * This allows us compute the length of a side of a triangle given the two other sides and the angle between those
 * sides. This requires all arguments to be positive.
 */
function law_of_cosines(a, b, angle) =
  assert(a > 0, str("length of side a must be positive but was", a))
  assert(b > 0, str("length of side b must be positive but was", b))
  assert(angle > 0, str("the supplied angle must be positive but was", angle))
  sqrt((a * a) + (b * b) - (2 * a * b * cos(angle)));


/*
 * This allows us compute one of the angles of a triangle.
 */
function law_of_sines(
  opposite, // The length of the side opposite of the angle we want to find
  side,     // The length of one of the other sides
  angle     // The angle opposite to the side length that was provided
) =
  assert(opposite > 0, str("length of opposite side must be positive but was", opposite))
  assert(side > 0, str("length of known side must be positive but was", side))
  assert(angle > 0, str("the known angle must be positive but was", angle))
  asin(opposite * sin(angle) / side);
