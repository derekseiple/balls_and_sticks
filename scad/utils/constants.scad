/*
 * constants.scad
 *
 *
 * Copyright © 2021 Derek Seiple
 * Licensed under Creative Commons BY-NC-SA 3.0. See license file.
 *
 *
 * This file should only define constants and therefore included into any other files that need them. A use statement
 * will not import these constants.
 *
 *
 * In many models/modules we want some notion of infinity. For example we may want to cut out a component and we don't
 * care how big it is. Instead of trying to assign a value that is big enough in each case we want to define a value
 * that will be larger than anything we will be dealing with. At the same time we don't want the value too big, because
 * OpenScad does not render as nice for values that are too big. Since everything made in this project will be 3D
 * printed, and because my 3D printer has a maximum print length of about 6in I will set INF to be about an order of
 * magnitude bigger
 */
INF = 1000;
