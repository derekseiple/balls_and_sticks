#
# point.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

from math import pi, cos, sin, atan2, asin


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
    def angle_between(a: 'Point', b: 'Point', c: 'Point') -> float:
        """Find the angle formed by the three points where b is the vertex. This is the signed angle from a to c. That
        is, if the angle is positive, it is a counter-clockwise rotation from a to c. If it is negative, it is a
        clockwise rotation. The returned angle is in degrees. This only works for 2D points in the x-y plane. If the
        z-coordinate is not 0, this will throw an error.
        """
        if a.z != 0 or b.z != 0 or c.z != 0:
            raise ValueError("This method only works for 2D points in the x-y plane.")
        ba = a - b
        bc = c - b
        return (atan2(bc.y, bc.x) - atan2(ba.y, ba.x)) * (180 / pi)

    @staticmethod
    def construct_from_polar(distance: float, angle: float):
        """Construct a point in the x-y plane from polar coordinates where the angle is in degrees. This will return a
        point with the given distance and angle from the positive x-axis and where the z-coordinate is 0.
        """
        radians = angle * (pi / 180)
        return Point(distance * cos(radians), distance * sin(radians))

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

    def rotate_radians(self, angle: float) -> 'Point':
        """Rotate this point around the origin by the given angle in radians.
        TODO update for 3D points.
        """
        return Point(self.x * cos(angle) - self.y * sin(angle), self.x * sin(angle) + self.y * cos(angle))

    def rotate_degrees(self, angle: float) -> 'Point':
        """Rotate this point around the origin by the given angle in degrees.
        TODO update for 3D points.
        """
        radians = angle * (pi / 180)
        return self.rotate_radians(radians)

    def degrees_from_x_axis(self) -> float:
        """This finds the angle in degrees that this point is rotated from the positive x-axis. I.e. the angle we would
        have to rotate the positive x-axis to get it to align with this point.
        TODO update for 3D points.
        """
        return atan2(self.y, self.x) * (180 / pi)

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
