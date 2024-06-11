#
# convex_polygon.py
#
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

from math import pi, cos, sin, atan2


class Point:
    """Represents a point in 2D space."""

    def __init__(self, x: float, y: float):
        self._x = x
        self._y = y

    @property
    def x(self):
        return self._x

    @property
    def y(self):
        return self._y

    @staticmethod
    def distance_between(p1: 'Point', p2: 'Point') -> float:
        """Find the distance between two points."""
        return p1.distance(p2)

    @staticmethod
    def angle_between(a: 'Point', b: 'Point', c: 'Point') -> float:
        """Find the angle formed by the three points where b is the vertex. This is the signed angle from a to c. That
        is, if the angle is positive, it is a counter-clockwise rotation from a to c. If it is negative, it is a
        clockwise rotation. The returned angle is in degrees.
        """
        ba = a - b
        bc = c - b
        return (atan2(bc.y, bc.x) - atan2(ba.y, ba.x)) * (180 / pi)

    @staticmethod
    def construct_from_polar(distance: float, angle: float):
        """Construct a point from polar coordinates where the angle is in degrees."""
        radians = angle * (pi / 180)
        return Point(distance * cos(radians), distance * sin(radians))

    def __str__(self) -> str:
        return "({}, {})".format(self.x, self.y)

    def __repr__(self):
        return str(self)

    def __eq__(self, other) -> bool:
        if not isinstance(other, Point):
            raise TypeError("Operands must be instances of Point")
        return self.x == other.x and self.y == other.y

    def __add__(self, other) -> 'Point':
        if not isinstance(other, Point):
            raise TypeError("Operands must be instances of Point")
        return Point(self.x + other.x, self.y + other.y)

    def __sub__(self, other) -> 'Point':
        if not isinstance(other, Point):
            raise TypeError("Operands must be instances of Point")
        return Point(self.x - other.x, self.y - other.y)

    def distance(self, other) -> float:
        """Find the distance between this point and another point."""
        return ((self.x - other.x) ** 2 + (self.y - other.y) ** 2) ** 0.5

    def magnitude(self) -> float:
        """Find the magnitude of this point as a vector."""
        return self.distance(Point(0.0, 0.0))

    def rotate_radians(self, angle: float) -> 'Point':
        """Rotate this point around the origin by the given angle in radians."""
        return Point(self.x * cos(angle) - self.y * sin(angle), self.x * sin(angle) + self.y * cos(angle))

    def rotate_degrees(self, angle: float) -> 'Point':
        """Rotate this point around the origin by the given angle in degrees."""
        radians = angle * (pi / 180)
        return self.rotate_radians(radians)
