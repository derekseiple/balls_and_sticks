#
# point.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

from math import pi, atan2, asin


class Point:
    """Represents a point in 3D space."""

    def __init__(self, x: float, y: float, z: float = 0.0):
        self._x = x
        self._y = y
        self._z = z

    @property
    def x(self):
        return self._x

    @property
    def y(self):
        return self._y

    @property
    def z(self):
        return self._z

    @staticmethod
    def distance_between(p1: 'Point', p2: 'Point') -> float:
        """Find the distance between two points."""
        return p1.distance(p2)

    def __str__(self) -> str:
        return "({}, {}, {})".format(self.x, self.y, self.z)

    def __repr__(self):
        return str(self)

    def __eq__(self, other) -> bool:
        if type(self) != type(other):
            raise TypeError("Operands must be instances of Point")
        return self.x == other.x and self.y == other.y and self.z == other.z

    def __add__(self, other) -> 'Point':
        if type(self) != type(other):
            raise TypeError("Operands must be instances of Point")
        return Point(self.x + other.x, self.y + other.y, self.z + other.z)

    def __sub__(self, other) -> 'Point':
        if type(self) != type(other):
            raise TypeError("Operands must be instances of Point")
        return Point(self.x - other.x, self.y - other.y, self.z - other.z)

    def __neg__(self):
        return Point(-self.x, -self.y, -self.z)

    def distance(self, other) -> float:
        """Find the distance between this point and another point."""
        return ((self.x - other.x) ** 2 + (self.y - other.y) ** 2 + (self.z - other.z) ** 2) ** 0.5

    def magnitude(self) -> float:
        """Find the magnitude of this point as a vector."""
        return self.distance(Point(0.0, 0.0, 0.0))

    def get_inclination_angle(self) -> float:
        """This finds the angle in degrees from the x-y plane to the vector formed by this point. Values will be between
        -90 and +90 degrees.
        """
        return asin(self.z / self.magnitude()) * (180 / pi)

    def get_azimuthal_angle(self) -> float:
        """This finds the angle in degrees from the positive x-axis to the projection of this point onto the x-y plane.
        Values will be between -180 and +180 degrees.
        """
        return atan2(self.y, self.x) * (180 / pi)
