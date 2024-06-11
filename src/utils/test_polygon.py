#
# test_polygon.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

import unittest
from math import sqrt
from src.utils.polygon import ConvexPolygonBuilder


class TestConvexPolygonBuilder(unittest.TestCase):

    def test_test(self):
        pass

    def test_fails_when_first_vertex_has_an_angle(self):
        bldr = ConvexPolygonBuilder()
        with self.assertRaises(ValueError):
            bldr.add_vertex(1.0, 45.0)

    def test_fails_when_subsequent_angle_is_not_given(self):
        bldr = ConvexPolygonBuilder()
        bldr.add_vertex(1.0)
        with self.assertRaises(ValueError):
            bldr.add_vertex(1.0)

    def test_fails_when_angle_is_not_between_0_and_180(self):
        bldr = ConvexPolygonBuilder()
        bldr.add_vertex(1.0)
        with self.assertRaises(ValueError):
            bldr.add_vertex(1.0, 200.0)

    def test_fails_when_polygon_is_concave(self):
        """We form the following two shapes, which are not convex:
                +---+
                |   |
                +   |
                    |
            o-------+

            +-------+
            |       |
            |   o---+
            |
            +
        """
        bldr = ConvexPolygonBuilder()
        bldr.add_vertex(2.0)
        bldr.add_vertex(2.0, 90.0)
        bldr.add_vertex(1.0, 90.0)
        with self.assertRaises(ValueError):
            bldr.add_vertex(1.0, 90.0)

        bldr = ConvexPolygonBuilder()
        bldr.add_vertex(1.0)
        bldr.add_vertex(1.0, 90.0)
        bldr.add_vertex(2.0, 90.0)
        with self.assertRaises(ValueError):
            bldr.add_vertex(2.0, 90.0)

    def test_convex_polygon_builder_works(self):
        """We form some regular polygons and ensure the vertices are in the right locations."""
        # Triangle
        triangle = (
            ConvexPolygonBuilder()
            .add_vertex(1.0)
            .add_vertex(1.0, 60.0)
            .build())
        triangle_vertices = [(0.0, 0.0), (1.0, 0.0), (0.5, sqrt(3) / 2)]
        for computed, expected in zip(triangle.vertices, triangle_vertices):
            self.assertAlmostEqual(computed.x, expected[0])
            self.assertAlmostEqual(computed.y, expected[1])

        # Square
        square = (
            ConvexPolygonBuilder()
            .add_vertex(1.0)
            .add_vertex(1.0, 90.0)
            .add_vertex(1.0, 90.0)
            .build())
        square_vertices = [(0.0, 0.0), (1.0, 0.0), (1.0, 1.0), (0.0, 1.0)]
        for computed, expected in zip(square.vertices, square_vertices):
            self.assertAlmostEqual(computed.x, expected[0])
            self.assertAlmostEqual(computed.y, expected[1])

        # Hexagon
        hexagon = (
            ConvexPolygonBuilder()
            .add_vertex(1.0)
            .add_vertex(1.0, 120.0)
            .add_vertex(1.0, 120.0)
            .add_vertex(1.0, 120.0)
            .add_vertex(1.0, 120.0)
            .build())
        hexagon_vertices = [
            (0.0, 0.0),
            (1.0, 0.0),
            (1.5, sqrt(3) / 2),
            (1.0, sqrt(3)),
            (0.0, sqrt(3)),
            (-0.5, sqrt(3) / 2)]
        for computed, expected in zip(hexagon.vertices, hexagon_vertices):
            self.assertAlmostEqual(computed.x, expected[0])
            self.assertAlmostEqual(computed.y, expected[1])
