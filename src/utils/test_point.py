#
# test_point.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

import unittest
from math import sqrt
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

    def test_angle_between(self):
        p1 = Point(1.0, 0.0)
        p2 = Point(0.0, 0.0)
        p3 = Point(1.0, 1.0)
        self.assertAlmostEqual(Point.angle_between(p1, p2, p3), 45.0)
        self.assertAlmostEqual(Point.angle_between(p3, p2, p1), -45.0)

        t1 = Point(1.0, 0.0)
        t2 = Point(0.0, 0.0)
        t3 = Point(0.5, sqrt(3) / 2)
        self.assertAlmostEqual(Point.angle_between(t1, t2, t3), 60.0)
        self.assertAlmostEqual(Point.angle_between(t3, t1, t2), 60.0)

    def test_rotation(self):
        p1 = Point(1.0, 0.0)
        p2 = p1.rotate_degrees(90.0)
        self.assertAlmostEqual(p2.x, 0.0)
        self.assertAlmostEqual(p2.y, 1.0)
        p3 = p1.rotate_degrees(180.0)
        self.assertAlmostEqual(p3.x, -1.0)
        self.assertAlmostEqual(p3.y, 0.0)
        p4 = p1.rotate_degrees(270.0)
        self.assertAlmostEqual(p4.x, 0.0)
        self.assertAlmostEqual(p4.y, -1.0)
        p5 = p1.rotate_degrees(360.0)
        self.assertAlmostEqual(p5.x, 1.0)
        self.assertAlmostEqual(p5.y, 0.0)
        p6 = p1.rotate_degrees(45.0)
        self.assertAlmostEqual(p6.x, sqrt(2) / 2)
        self.assertAlmostEqual(p6.y, sqrt(2) / 2)
        p7 = p1.rotate_degrees(-45.0)
        self.assertAlmostEqual(p7.x, sqrt(2) / 2)
        self.assertAlmostEqual(p7.y, -sqrt(2) / 2)
