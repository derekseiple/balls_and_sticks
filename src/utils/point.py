#
# point.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

from math import pi, atan2, asin, acos, cos, sin, radians, degrees
from src.utils.direction import Direction
from src.utils.echeck import echeck


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

    @staticmethod
    def angle_between(p1: 'Point', p2: 'Point') -> float:
        """Find the angle formed by p1, the origin, and p2 in degrees."""
        return p1.angle(p2)

    @staticmethod
    def create_from_direction_and_distance(direction: Direction, distance: float) -> 'Point':
        """Create a point from a direction and a distance. This assumes the direction and distance are relative to the
        origin.
        """
        echeck(distance >= 0, "Distance must be non-negative")
        inclination = radians(direction.inclination)
        azimuthal = radians(direction.azimuthal)
        return Point(
            distance * cos(inclination) * cos(azimuthal),
            distance * cos(inclination) * sin(azimuthal),
            distance * sin(inclination),
        )

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

    def __abs__(self) -> float:
        return self.magnitude()

    def scale(self, scalar: float) -> 'Point':
        return Point(self.x * scalar, self.y * scalar, self.z * scalar)

    def cross(self, other: 'Point') -> 'Point':
        if type(self) != type(other):
            raise TypeError("Operands must be instances of Point")
        return Point(
            self.y * other.z - self.z * other.y,
            self.z * other.x - self.x * other.z,
            self.x * other.y - self.y * other.x,
        )

    def distance(self, other) -> float:
        """Find the distance between this point and another point."""
        return ((self.x - other.x) ** 2 + (self.y - other.y) ** 2 + (self.z - other.z) ** 2) ** 0.5

    def magnitude(self) -> float:
        """Find the magnitude of this point as a vector."""
        return self.distance(Point(0.0, 0.0, 0.0))

    def dot(self, other: 'Point') -> float:
        if type(self) != type(other):
            raise TypeError("Operands must be instances of Point")
        return self.x * other.x + self.y * other.y + self.z * other.z

    def angle(self, other: 'Point') -> float:
        """Find the angle formed by this point, the origin, and another point in degrees."""
        return degrees(acos(self.dot(other) / (self.magnitude() * other.magnitude())))

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
