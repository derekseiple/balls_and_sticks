/*
 * connection_defaults.scad
 *
 * This file should only define constants and therefore be included into any other files that need them. A use statement
 * will not import these constants.
 *
 * This file defines the default values to use for the connection pin and connection sleeve. Since the two components
 * work closely together, and because we want to easily be able to manage these defaults we define them in one place and
 * make use of them in both the pin module and sleeve module.
 */


CONNECTION_HEIGHT = 16;        // total height of the pin
CONNECTION_RADIUS = 2.5;       // radius of the pin shaft
CONNECTION_BUMP_WIDTH = 0.5;   // the width of the bump out (from the shaft to outermost point)
CONNECTION_BUMP_HEIGHT = 1.75; // the total height of the middle bump (from where it first extends beyond the shaft)
CONNECTION_SLOT_WIDTH = 1;     // the width of the slot
CONNECTION_HOLE_RADIUS = 1.5;  // radius of the inner hole