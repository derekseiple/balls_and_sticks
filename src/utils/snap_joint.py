#
# snap_joint.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

from solid2 import polygon, square, cylinder
from src.utils.constants import EPS


class SnapJoint:
    """This class holds the geometry of the snap joint used in the SingleBondModel class. It is used to connect two
    atoms together in a single bond. This class has two methods, one to generate the snap ring model and one to
    generate the complementary snap receiver model that the snap join fits into.
    """

    def __init__(
        self,
        clearance: float = 0.5,  # space between the snap ring and the portion that holds it, like the atom.
        lip: float = 0.75,       # defines the size of the "lip" in the snap ring.
        radius: float = 3.25,    # allows us to control how large the snap ring is.
        indent: float = 0.5,     # this defines how far inset from the bottom of the atom we position the snap joint.
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
        TODO:
        rotate([0, 90, 0]) {
          difference() {
            copy_and_mirror([0, 0, 1]) {
              difference() {
                union() {
                  rotate_extrude() {
                    translate([radius - (clearance / 2), indent, 0]) {
                      polygon(points = [
                        [0, 0], [0 + lip, lip], [0 + lip, 2*lip], [0, 3*lip], [-2, 3*lip], [-2, 0]
                      ]);
                      translate([-2, -indent]) {
                        square(size = [2, indent], center = false);
                      }
                    }
                  };
                  translate([0,0,0.5]) {
                    cylinder(h = 1, r = 1.25, center = true);
                  };
                }
                translate([0,0,1.75]) {
                  cube(size = [3*radius, radius + lip - 2, radius + lip - 2], center = true);
                }
              }
            };
            translate([radius - (clearance / 2) - EPS, -3 * radius / 2, -3 * radius / 2]) {
              cube(3 * radius);
            }
          }
        }
        }
        """
        pass

    def snap_receiver_model(self):
        """This model returns the space that the snap ring fits into. This is the portion of the atom that will be
        removed to make room for the snap ring."""
        model = polygon([
            [0, 0],
            [self._lip, self._lip],
            [self._lip, 2 * self._lip],
            [-self._lip, 4 * self._lip],
            [1, 4 * self._lip],
            [1, 0]])
        model += square(1, self._indent).translate([0, -self._indent])
        model = model.translate([self._radius + (self._clearance / 2), 0, 0])
        model = model.rotate_extrude()

        r = self._radius + (self._clearance / 2) + self._lip
        h = 4 * self._lip + self._indent - EPS
        return cylinder(r=r, h=h).translate([0, 0, EPS / 2 - self._indent]) - model
