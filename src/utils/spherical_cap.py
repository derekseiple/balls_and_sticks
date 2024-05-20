#
# spherical_cap.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

from solid2 import sphere, cube


def spherical_cap(r: float):
    """This function generates a spherical cap with radius r, that is, a sphere cut in half."""
    return sphere(r) - cube(2 * r, center=True).translate([0, 0, -r])
