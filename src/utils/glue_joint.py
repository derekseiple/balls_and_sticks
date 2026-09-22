#
# glue_joint.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

from solid2 import cylinder


class GlueJoint:
    """This class holds the geometry of the glue joint used in the FixedBondModel class. It is used to connect two
    atoms together in a double or triple bond. By definition those types of bonds do not move/rotate, so the best thing
    is to just glue them together, but this joint will ensure they are aligned while being glued.
    The joint is a pair of holes that a short piece of filament is glued into. One hole is on the axis of the bond and
    the other is out along the positive x-axis. Both atoms of a bond put that second hole on the same side, so the pair
    of pins only lets them be glued at the one angle that has them oriented correctly with respect to each other.
    There is nothing to print for this joint, so this class only generates the space to remove from the atoms.
    """

    def __init__(
        self,
        clearance: float = 0.25,
        pin_diameter: float = 1.75,
        pin_offset: float = 5.0,
        depth: float = 4.0,
    ) -> None:
        """Constructor.

        Parameters
        ----------
        clearance : float
            The space between the pin and the hole that holds it, so that the filament slides in rather than having to
            be forced.

        pin_diameter : float
            The diameter of the filament used for the pins.

        pin_offset : float
            The distance from the axis of the joint out to the second hole. Since the atom is cut off at a circular
            face, this has to be small enough that the hole stays on that face.

        depth : float
            How far each hole reaches into an atom.
        """
        self.__clearance: float = clearance
        self.__pin_diameter: float = pin_diameter
        self.__pin_offset: float = pin_offset
        self.__depth: float = depth

    @property
    def clearance(self) -> float:
        return self.__clearance

    @property
    def pin_diameter(self) -> float:
        return self.__pin_diameter

    @property
    def pin_offset(self) -> float:
        return self.__pin_offset

    @property
    def depth(self) -> float:
        return self.__depth

    @property
    def hole_radius(self) -> float:
        """The radius of the holes left in the atoms, which is the filament plus the clearance."""
        return (self.pin_diameter + self.clearance) / 2

    @property
    def receiver_outer_radius(self) -> float:
        """The distance from the axis of the joint out to the furthest material the receiver removes. Anything else we
        put on the face of the atom, such as a label, has to stay outside of this.
        """
        return self.pin_offset + self.hole_radius

    def receiver_model(self):
        """This generates the two holes that the pins fit into. This is the shape that will be removed from the atom to
        make space for them. The holes straddle the face where the two atoms meet, so each atom is left with a hole a
        depth deep and the pin bridges the two.
        """
        hole = cylinder(h=2 * self.depth, r=self.hole_radius, center=True)
        return hole + hole.right(self.pin_offset)
