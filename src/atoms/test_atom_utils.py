#
# test_atom_utils.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

import unittest
from src.atoms.atom_utils import SphericalCapData, intersection_of_plane_pairs, intersection_of_plane_triples
from src.atoms.atom_utils import singal_plane_max_point, spherical_cap_is_redundant
from src.utils.direction import Direction
from src.utils.point import Point


class TestSphericalCapData(unittest.TestCase):

    def test_unit_vector(self):
        cases = [
            Direction(0.0, 0.0),
            Direction(90.0, 0.0),
            Direction(-90.0, 0.0),
            Direction(0.0, 90.0),
            Direction(0.0, -180.0),
            Direction(45.0, 45.0),
            Direction(-30.0, 135.0),
        ]
        for direction in cases:
            original = Point.create_from_direction_and_distance(direction, 2.5)
            cap = SphericalCapData(direction, 2.5)
            self.assertAlmostEqual(cap.unit_vector.magnitude(), 1.0)
            self.assertAlmostEqual(Point.angle_between(original, cap.unit_vector), 0.0)


class TestIntersectionOfPlaneTriples(unittest.TestCase):

    def test_coordinate_planes(self):
        caps = [
            SphericalCapData(Direction(0.0, 0.0), 2.0),
            SphericalCapData(Direction(0.0, 90.0), 3.0),
            SphericalCapData(Direction(90.0, 0.0), 4.0),
        ]
        points = intersection_of_plane_triples(caps)
        self.assertEqual(len(points), 1)
        self.assertAlmostEqual(points[0].x, 2.0)
        self.assertAlmostEqual(points[0].y, 3.0)
        self.assertAlmostEqual(points[0].z, 4.0)

    def test_unit_offset_xyz(self):
        caps = [
            SphericalCapData(Direction(0.0, 0.0), 1.0),
            SphericalCapData(Direction(0.0, 90.0), 1.0),
            SphericalCapData(Direction(90.0, 0.0), 1.0),
        ]
        points = intersection_of_plane_triples(caps)
        self.assertEqual(len(points), 1)
        self.assertAlmostEqual(points[0].x, 1.0)
        self.assertAlmostEqual(points[0].y, 1.0)
        self.assertAlmostEqual(points[0].z, 1.0)

    def test_singular_planes_have_no_unique_intersection(self):
        caps = [
            SphericalCapData(Direction(0.0, 0.0), 1.0),
            SphericalCapData(Direction(0.0, 90.0), 1.0),
            SphericalCapData(Direction(0.0, 45.0), 2 ** 0.5),
        ]
        self.assertEqual(intersection_of_plane_triples(caps), [])

    def test_parallel_planes_have_no_unique_intersection(self):
        caps = [
            SphericalCapData(Direction(0.0, 0.0), 1.0),
            SphericalCapData(Direction(0.0, 0.0), 2.0),
            SphericalCapData(Direction(0.0, 0.0), 3.0),
        ]
        self.assertEqual(intersection_of_plane_triples(caps), [])


class TestIntersectionOfPlanePairs(unittest.TestCase):

    def test_xy_planes_on_sphere(self):
        caps = [
            SphericalCapData(Direction(0.0, 0.0), 1.0),
            SphericalCapData(Direction(0.0, 90.0), 1.0),
        ]
        points = intersection_of_plane_pairs(2.0, caps)
        root2 = 2 ** 0.5
        self.assertEqual(len(points), 2)
        self.assertAlmostEqual(points[0], Point(1.0, 1.0, root2))
        self.assertAlmostEqual(points[1], Point(1.0, 1.0, -root2))

    def test_xz_planes_on_sphere(self):
        caps = [
            SphericalCapData(Direction(0.0, 0.0), 1.0),
            SphericalCapData(Direction(90.0, 0.0), 1.0),
        ]
        points = intersection_of_plane_pairs(2.0, caps)
        root2 = 2 ** 0.5
        self.assertEqual(len(points), 2)
        self.assertAlmostEqual(points[0], Point(1.0, -root2, 1.0))
        self.assertAlmostEqual(points[1], Point(1.0, root2, 1.0))

    def test_parallel_planes_have_no_intersection(self):
        caps = [
            SphericalCapData(Direction(0.0, 0.0), 1.0),
            SphericalCapData(Direction(0.0, 0.0), 2.0),
        ]
        self.assertEqual(intersection_of_plane_pairs(5.0, caps), [])

    def test_line_misses_sphere(self):
        caps = [
            SphericalCapData(Direction(0.0, 0.0), 1.0),
            SphericalCapData(Direction(0.0, 90.0), 1.0),
        ]
        self.assertEqual(intersection_of_plane_pairs(1.0, caps), [])


class TestSingalPlaneMaxPoint(unittest.TestCase):

    def test_max_along_y_on_x_plane(self):
        cap = SphericalCapData(Direction(0.0, 0.0), 1.0)
        candidate = SphericalCapData(Direction(0.0, 90.0), 1.0)
        points = singal_plane_max_point(2.0, candidate, cap)
        self.assertEqual(len(points), 1)
        self.assertAlmostEqual(points[0], Point(1.0, 3 ** 0.5, 0.0))

    def test_max_along_z_on_x_plane(self):
        cap = SphericalCapData(Direction(0.0, 0.0), 1.0)
        candidate = SphericalCapData(Direction(90.0, 0.0), 1.0)
        points = singal_plane_max_point(2.0, candidate, cap)
        self.assertEqual(len(points), 1)
        self.assertAlmostEqual(points[0], Point(1.0, 0.0, 3 ** 0.5))

    def test_max_along_negative_y_on_x_plane(self):
        cap = SphericalCapData(Direction(0.0, 0.0), 1.0)
        candidate = SphericalCapData(Direction(0.0, -90.0), 1.0)
        points = singal_plane_max_point(2.0, candidate, cap)
        self.assertEqual(len(points), 1)
        self.assertAlmostEqual(points[0], Point(1.0, -(3 ** 0.5), 0.0))

    def test_point_lies_on_sphere_and_plane(self):
        cap = SphericalCapData(Direction(45.0, 45.0), 1.0)
        candidate = SphericalCapData(Direction(0.0, 0.0), 1.0)
        radius = 2.0
        points = singal_plane_max_point(radius, candidate, cap)
        self.assertEqual(len(points), 1)
        self.assertAlmostEqual(points[0].magnitude(), radius)
        self.assertAlmostEqual(points[0].dot(cap.unit_vector), cap.distance)

    def test_plane_misses_sphere(self):
        cap = SphericalCapData(Direction(0.0, 0.0), 3.0)
        candidate = SphericalCapData(Direction(0.0, 90.0), 1.0)
        self.assertEqual(singal_plane_max_point(2.0, candidate, cap), [])

    def test_tangent_plane(self):
        cap = SphericalCapData(Direction(0.0, 0.0), 2.0)
        candidate = SphericalCapData(Direction(0.0, 90.0), 1.0)
        self.assertEqual(singal_plane_max_point(2.0, candidate, cap), [])


class TestSphericalCapIsRedundant(unittest.TestCase):

    def test_no_other_caps(self):
        candidate = SphericalCapData(Direction(0.0, 0.0), 1.0)
        self.assertFalse(spherical_cap_is_redundant(2.0, candidate, []))
        self.assertTrue(spherical_cap_is_redundant(0.5, candidate, []))

    def test_smaller_cap_behind_larger_same_direction(self):
        larger = SphericalCapData(Direction(0.0, 0.0), 1.0)
        smaller = SphericalCapData(Direction(0.0, 0.0), 1.5)
        self.assertTrue(spherical_cap_is_redundant(2.0, smaller, [larger]))
        self.assertFalse(spherical_cap_is_redundant(2.0, larger, [smaller]))

    def test_orthogonal_cap_is_needed(self):
        cap_x = SphericalCapData(Direction(0.0, 0.0), 1.0)
        cap_y = SphericalCapData(Direction(0.0, 90.0), 1.0)
        candidate_z = SphericalCapData(Direction(90.0, 0.0), 1.0)
        self.assertFalse(spherical_cap_is_redundant(2.0, candidate_z, [cap_x, cap_y]))

    def test_disjoint_caps_are_both_needed(self):
        """The two hydrogen cuts on the oxygen of water. They do not overlap, so neither can be dropped."""
        radius = 1.0
        first = SphericalCapData(Direction(90.0, 0.0), 0.75)
        second = SphericalCapData(Direction(-90.0, 0.0), 0.75)
        self.assertFalse(spherical_cap_is_redundant(radius, first, [second]))
        self.assertFalse(spherical_cap_is_redundant(radius, second, [first]))

    def test_cap_covered_by_two_others_is_redundant(self):
        """Neither neighbor contains the candidate on its own, but together they cover it."""
        radius = 1.0
        left = SphericalCapData(Direction(0.0, -45.0), 0.5)
        right = SphericalCapData(Direction(0.0, 45.0), 0.5)
        candidate = SphericalCapData(Direction(0.0, 0.0), 0.8)
        self.assertTrue(spherical_cap_is_redundant(radius, candidate, [left, right]))
        self.assertFalse(spherical_cap_is_redundant(radius, candidate, [left]))
        self.assertFalse(spherical_cap_is_redundant(radius, candidate, [right]))
