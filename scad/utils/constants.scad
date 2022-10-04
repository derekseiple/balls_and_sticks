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
 */

 /*
 *
 * In many models/modules we want some notion of infinity. For example we may want to cut out a component and we don't
 * care how big it is. Instead of trying to assign a value that is big enough in each case we want to define a value
 * that will be larger than anything we will be dealing with. At the same time we don't want the value too big, because
 * OpenScad does not render as nice for values that are too big. Since everything made in this project will be 3D
 * printed, and because my 3D printer has a maximum print length of about 6in I will set INF to be about an order of
 * magnitude bigger
 */
INF = 1000;

/*
 * Sometimes, in order for the geometry to render properly we need parts to overlap by some small amount. EPS is the
 * value we use whenever possible. We set it to a reasonably small value. Since we will be 3D printing these parts we
 * just choose a value that is smaller than the tolerance of the printer.
 */
EPS = 0.001;

/*
 * We want a convenient way to work in the units at the atomic scale while at the same time ending up with a reasonable
 * real-world scale. Since the convenient unit is the picometer (pm), we define that unit to be a scale factor, so that
 * if we want something that is say 120pm in length we can simply express it as 120*pm. We chose this particular scale
 * factor so that the Van der Waals radius of hydrogen is 9mm in real-world scale. That is 120*pm == 9,
 * or pm = 9/120.
 */
pm = 9/120;
