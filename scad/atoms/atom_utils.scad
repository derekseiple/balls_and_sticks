/*
 * atom_utils.scad
 *
 * Copyright © 2021 Derek Seiple
 * Licensed under Creative Commons BY-NC-SA 3.0. See license file.
 */

/*
 * Given the atomic radii of two atoms (Generally the Van der Waals radius
 * https://en.wikipedia.org/wiki/Van_der_Waals_radius) and the distance between the atoms when bonded, this computes the
 * distance from the center of the atom to the bottom of the Spherical Cap (https://en.wikipedia.org/wiki/Spherical_cap)
 * that we remove so the two mating atoms can sit flush to each other.
 */
function atom_slice_distance(atom_radius, mates_radius, bond_distance) =
  assert(atom_radius > 0, "atom_radius must be positive.")
  assert(mates_radius > 0, "mates_radius must be positive.")
  assert(bond_distance > 0, "bond_distance must be positive.")
  ((atom_radius + mates_radius)*(atom_radius - mates_radius) + bond_distance^2) / (2 * bond_distance);
