#
# revolve_text.py
#
# Copyright © 2026 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

from solid2 import circle, text, square
from src.utils.echeck import echeck


def revolve_text(inner_radius: float, outer_radius: float, msg: str):
    """This takes text and aligns it around a circle so that it fills the band between the given radii. The font size
    is derived from the width of the band, and anything that falls outside of the band is clipped off. Since the font
    size only approximates the height of a capital letter, glyphs with ascenders or descenders would otherwise spill
    over the edges of the band.
    """
    echeck(inner_radius < outer_radius, "The outer radius must be larger than the inner radius.")
    font_size = outer_radius - inner_radius
    center_radius = (inner_radius + outer_radius) / 2
    model = square(0)
    for i in range(len(msg)):
        txt = text(text=msg[i], font="Liberation Sans:style=Bold", size=font_size, valign="center", halign="center")
        model += txt.translate(0, center_radius, 0).rotate(-i * 360 / len(msg))
    band = circle(r=outer_radius) - circle(r=inner_radius)
    return model * band
