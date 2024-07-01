#
# bond.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

from typing import Optional
from abc import abstractmethod
from solid2 import cube, linear_extrude
from src.utils.constants import EPS
from src.utils.snap_joint import SnapJoint
from src.utils.spherical_cap import spherical_cap
from src.utils.revolve_text import revolve_text


class BondModel:
    """This is the abstract class for a bond model. It is used to define the shape of the bond between two atoms. This
    allows us to define different subclasses for different types of bonds between atoms.
    """
    @abstractmethod
    def model(
        self,
        label: Optional[str]
    ):
        raise NotImplementedError("The model method must be implemented by the subclass.")


class NoBondModel(BondModel):
    """THe NoBondModel class is used to represent a bond that does not exist between two atoms, That is, the two atoms
    are neighbors but they are not bonded together.
    """
    def __init__(self):
        pass

    def model(
        self,
        label: Optional[str]
    ):
        """We have to return something, so we return a cube with no size."""
        return cube(0)


class SingleBondModel(BondModel):
    """The SingleBondModel class is used to represent a single bond between two atoms. This bond is able to rotate in
    space, so we use a snap joint design to connect the two atoms together.
    """
    def __init__(self):
        pass

    def model(
        self,
        label: Optional[str]
    ):
        """We return the space that the snap joint occupies so that we can subtract it from the atom model."""
        snap = SnapJoint()
        receiver = snap.snap_receiver_model().translate(0, 0, -2 * EPS + snap.indent)
        cap = (
            spherical_cap(r=snap.clearance / 2 + snap.radius - snap.lip)
            .translate(0, 0, 4 * (snap.lip - EPS) + snap.indent - EPS))
        model = receiver + cap
        if label is not None:
            model += linear_extrude(1)(
                revolve_text(1.25 * snap.radius, 4, label + ' ' + label + ' ').mirror(0, 1, 0)
            ).translate(0, 0, -0.5)
        return model


class FixedBondModel(BondModel):

    def __init__(self) -> None:
        pass

    def model(
        self,
        label: Optional[str]
    ):
        # TODO: Implement the FixedBondModel and pick an appropriate text radius
        text_radius = 3.25
        model = cube(0)
        if label is not None:
            model += linear_extrude(1)(
                revolve_text(1.25 * text_radius, 4, label + ' ' + label + ' ').mirror(0, 1, 0)
            ).translate(0, 0, -0.5)
        return model


def bond_model_from_order(bond_order: int) -> BondModel:
    """This function will return the bond model that corresponds to the given bond order. This allows us to easily
    switch between bond models based on the bond order.
    """
    if bond_order == 0:
        return NoBondModel()
    elif bond_order == 1:
        return SingleBondModel()
    elif bond_order in [2, 3]:
        return FixedBondModel()
    else:
        raise ValueError("The bond order must be between 0 and 3.")
