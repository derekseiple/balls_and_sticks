#
# glue_joint.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

from solid2 import circle, sphere, square, cube, cylinder


class GlueJoint:
    """This class holds the geometry of the glue joint used in the FixedBondModel class. It is used to connect two
    atoms together in a double or triple bond. By definition those types of bonds do not move/rotate, so the best thing
    is to just glue them together, but this joint will ensure they are aligned while being glued.
    The joint is keyed by a spherical tab on the positive x-axis of the ring, which drops into a matching pocket in
    each atom. Both atoms of a bond put that pocket on the same side, so the tab only lets them be glued at the one
    angle that has them oriented correctly with respect to each other.
    This class has two methods, one to generate the ring model and one to generate the complementary space to ring fits
    into.
    """

    def __init__(
        self,
        clearance: float = 0.1,
        major_radius: float = 3.25,
        minor_radius: float = 1.75,
    ) -> None:
        """Constructor.

        Parameters
        ----------
        clearance : float
            The space between the ring and the torus that holds it.

        major_radius : float
            The major radius of the ring. This is the distance from the axis of the joint to the center of the torus
            tube.

        minor_radius : float
            The minor radius of the ring. This is the radius of the torus tube itself. This is also the radius of the
            key that sticks out of the ring.
        """
        self.__clearance: float = clearance
        self.__major_radius: float = major_radius
        self.__minor_radius: float = minor_radius

    @property
    def clearance(self) -> float:
        return self.__clearance

    @property
    def major_radius(self) -> float:
        return self.__major_radius

    @property
    def minor_radius(self) -> float:
        return self.__minor_radius

    def ring_model(self):
        """This generates the ring model that will fit into the torus shape."""
        model = square((self.minor_radius - self.clearance) * (2 ** 0.5), center=True).right(self.major_radius)
        model = model.rotate_extrude()
        right_offset = self.major_radius + self.minor_radius
        model += cube((self.minor_radius - self.clearance) * (2 ** 0.5), center=True).right(right_offset)
        return model

    def receiver_model(self):
        """This generates the torus shape that the ring will fit into. This is the shape that will be removed from the
        atom to make space for the ring.
        """
        model = circle(self.minor_radius).right(self.major_radius)
        model = model.rotate_extrude()
        model += sphere(self.minor_radius).right(self.major_radius + self.minor_radius)
        # ADD a cylindar with minor radius that bridges the sphere and ring
        model += cylinder(h=self.minor_radius, r=self.minor_radius).rotate(0, 90, 0).right(self.major_radius)
        return model
