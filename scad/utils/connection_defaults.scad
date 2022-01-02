/*
 * connection_defaults.scad
 *
 * Copyright © 2021 Derek Seiple
 * Licensed under Creative Commons BY-NC-SA 3.0. See license file.
 *
 *
 * This file should only define constants and therefore be included into any other files that need them. A use statement
 * will not import these constants.
 *
 * This file defines the default values to use for the connection pin and connection sleeve. Since the two components
 * work closely together, and because we want to easily be able to manage these defaults we define them in one place and
 * make use of them in both the pin module and sleeve module.
 *
 *
 * These define the defaults of the connection profile.
 */
CONNECTION_HEIGHT = 6.25;      // total height of the connection profile
CONNECTION_RADIUS = 2.25;      // radius of the pin shaft
CONNECTION_BUMP_WIDTH = 0.5;   // the width of the bump out (from the shaft to outermost point)
CONNECTION_BUMP_HEIGHT = 1.75; // the total height of the middle bump (from where it first extends beyond the shaft)

/*
 * These define the defaults of the non-profile parts of the pin.
 */
PIN_SLOT_WIDTH = 0.9;          // the width of the slot in the pin
PIN_SLOT_LENGTH_PCT = 0.75;    // specifies the slot length as a percentage of the connection height

/*
 * These define the defaults of the non-profile parts of the sleeve.
 */
SLEEVE_RADIUS = 4.5;           // the outside radius of the sleeve
SLEEVE_CLEARANCE = 0.25;       // the gap to have between the pin geometry and the sleeve