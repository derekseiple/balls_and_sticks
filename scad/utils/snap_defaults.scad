/*
 * snap_defaults.scad
 *
 * Copyright © 2022 Derek Seiple
 * Licensed under Creative Commons BY-NC-SA 3.0. See license file.
 *
 * This file should only define constants and therefore be included into any other files that need them. A use statement
 * will not import these constants.
 *
 * This file defines the default values to use for the snap joints.
 */

SNAP_CLEARANCE = 0.5; // space between the snap ring and the portion that holds it, like the atom.
SNAP_LIP = 0.75;      // defines the size of the "lip" in the snap ring.
SNAP_RADIUS = 3.25;   // allows us to control how large the snap ring is.
SNAP_INDENT = 0.5;    // this defines how far inset from the bottom of the atom we position the snap joint.
