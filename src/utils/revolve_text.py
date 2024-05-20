#
# revolve_text.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

from solid2 import text, square


def revolve_text(radius: float, font_size: float, msg: str):
    """This takes text and aligns it around a circle with the given radius and font size."""
    model = square(0)
    for i in range(len(msg)):
        txt = text(text=msg[i], font="Liberation Sans:style=Bold", size=font_size, valign="center", halign="center")
        model += txt.translate(0, radius + font_size / 2, 0).rotate(-i * 360 / len(msg))
    return model
