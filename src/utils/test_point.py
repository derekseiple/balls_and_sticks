#
# test_point.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

import unittest
from src.utils.point import Point


class TestPoint(unittest.TestCase):

    def test_add_sub(self):
        p1 = Point(3.0, 4.0)
        p2 = Point(1.0, 2.0)
        self.assertEqual(p1 + p2, Point(4.0, 6.0))
        self.assertEqual(p1 - p2, Point(2.0, 2.0))

    def test_distance(self):
        p1 = Point(0.0, 0.0)
        p2 = Point(3.0, 4.0)
        self.assertEqual(Point.distance_between(p1, p2), 5.0)
        self.assertEqual(p1.distance(p2), 5.0)

    def test_inclination_and_azimuthal(self):
        one_over_root2 = 1 / 2 ** 0.5
        p = Point(one_over_root2, one_over_root2, 1.0)
        self.assertAlmostEqual(p.get_inclination_angle(), 45.0)
        self.assertAlmostEqual(p.get_azimuthal_angle(), 45.0)

        p = Point(one_over_root2, one_over_root2, -1.0)
        self.assertAlmostEqual(p.get_inclination_angle(), -45.0)
        self.assertAlmostEqual(p.get_azimuthal_angle(), 45.0)

        p = Point(one_over_root2, -one_over_root2, 1.0)
        self.assertAlmostEqual(p.get_inclination_angle(), 45.0)
        self.assertAlmostEqual(p.get_azimuthal_angle(), -45.0)

        p = Point(one_over_root2, -one_over_root2, -1.0)
        self.assertAlmostEqual(p.get_inclination_angle(), -45.0)
        self.assertAlmostEqual(p.get_azimuthal_angle(), -45.0)

        p = Point(-one_over_root2, one_over_root2, 1.0)
        self.assertAlmostEqual(p.get_inclination_angle(), 45.0)
        self.assertAlmostEqual(p.get_azimuthal_angle(), 135.0)

        p = Point(-one_over_root2, one_over_root2, -1.0)
        self.assertAlmostEqual(p.get_inclination_angle(), -45.0)
        self.assertAlmostEqual(p.get_azimuthal_angle(), 135.0)

        p = Point(-one_over_root2, -one_over_root2, 1.0)
        self.assertAlmostEqual(p.get_inclination_angle(), 45.0)
        self.assertAlmostEqual(p.get_azimuthal_angle(), -135.0)

        p = Point(-one_over_root2, -one_over_root2, -1.0)
        self.assertAlmostEqual(p.get_inclination_angle(), -45.0)
        self.assertAlmostEqual(p.get_azimuthal_angle(), -135.0)
