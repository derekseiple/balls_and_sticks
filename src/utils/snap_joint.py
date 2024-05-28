#
# snap_joint.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

from solid2 import polygon, square, cylinder, cube
from src.utils.constants import EPS


class SnapJoint:
    """This class holds the geometry of the snap joint used in the SingleBondModel class. It is used to connect two
    atoms together in a single bond. This class has two methods, one to generate the snap ring model and one to
    generate the complementary snap receiver model that the snap join fits into.
    """

    def __init__(
        self,
        clearance: float = 0.5,
        lip: float = 0.75,
        radius: float = 3.25,
        indent: float = 0.5,
    ) -> None:
        """Constructor.

        Parameters
        ----------
        clearance : float
            The space between the snap ring and the portion that holds it, like the atom.

        lip : float
            Defines the size of the "lip" in the snap ring.

        radius : float
            Allows us to control how large the snap ring is.

        indent : float
            This defines how far inset from the bottom of the atom we position the snap joint.

        """
        self._clearance: float = clearance
        self._lip: float = lip
        self._radius: float = radius
        self._indent: float = indent

    @property
    def clearance(self) -> float:
        return self._clearance

    @property
    def lip(self) -> float:
        return self._lip

    @property
    def radius(self) -> float:
        return self._radius

    @property
    def indent(self) -> float:
        return self._indent

    def snap_ring_model(self):
        """This method returns the snap ring model. This is the ring that snaps into the atoms' cavities to hold them
        together.
        """
        # make the snap ring profile
        half = polygon([
            [0, 0],
            [0 + self.lip, self.lip],
            [0 + self.lip, 2 * self.lip],
            [0, 3 * self.lip],
            [-2, 3 * self.lip],
            [-2, 0]])
        half += square(2, self.indent, center=False).translate([-2, -self.indent])
        half = half.translate([self.radius - (self.clearance / 2), self.indent, 0])
        half = half.rotate_extrude()
        half += cylinder(h=1, r=1.25, center=True).translate([0, 0, 0.5])
        # make the notch to cut out of the atom
        notch = cube(3 * self.radius, self.radius + self.lip - 2, self.radius + self.lip - 2 + EPS, center=True)
        half -= notch.translate([0, 0, 1.75])
        # Now mirror and copy the half to make the full snap ring
        model = half + half.mirror([0, 0, 1])
        # Make flat bottom for printing
        bottom = cube(3 * self.radius)
        model -= bottom.translate(self.radius - (self.clearance / 2) - EPS, -3 * self.radius / 2, -3 * self.radius / 2)
        return model.rotate([0, 90, 0])

    def snap_receiver_model(self):
        """This model returns the space that the snap ring fits into. This is the portion of the atom that will be
        removed to make room for the snap ring."""
        model = polygon([
            [0, 0],
            [self.lip, self.lip],
            [self.lip, 2 * self.lip],
            [-self.lip, 4 * self.lip],
            [1, 4 * self.lip],
            [1, 0]])
        model += square(1, self.indent).translate([0, -self.indent])
        model = model.translate([self.radius + (self.clearance / 2), 0, 0])
        model = model.rotate_extrude()

        r = self.radius + (self.clearance / 2) + self.lip
        h = 4 * self.lip + self.indent - EPS
        return cylinder(r=r, h=h).translate([0, 0, EPS / 2 - self.indent]) - model
