/*
 * text_utils.scad
 *
 * Copyright © 2022 Derek Seiple
 * Licensed under Creative Commons BY-NC-SA 3.0. See license file.
 */

/*
 * This takes text and aligns it around a circle.
 */
module revolve_text(radius, font_size, chars) {
  for (i = [0 : len(chars) - 1]) {
    rotate(-i * 360 / len(chars)) {
      translate([0, radius + font_size / 2, 0]) {
        text(chars[i], font = "Liberation Sans:style=Bold", size = font_size, valign = "center", halign = "center");
      }
    }
  }
}
