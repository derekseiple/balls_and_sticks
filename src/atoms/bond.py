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
from src.utils.glue_joint import GlueJoint
from src.utils.spherical_cap import spherical_cap
from src.utils.revolve_text import revolve_text
from src.utils.echeck import echeck


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

    def apply_label(self, model, inner_radius: float, outer_radius: float, label: Optional[str]):
        if label is not None:
            model += linear_extrude(1)(
                revolve_text(inner_radius, outer_radius, label + ' ' + label + ' ').mirror(0, 1, 0)
            ).translate(0, 0, -0.5)
        return model


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

    def __init__(
        self,
        max_label_radius: float
    ):
        self._max_label_radius = max_label_radius

    def model(
        self,
        label: Optional[str]
    ):
        """We return the space that the snap joint occupies so that we can subtract it from the atom model."""
        snap = SnapJoint()
        receiver = snap.receiver_model().translate(0, 0, -2 * EPS + snap.indent)
        cap = (
            spherical_cap(r=snap.clearance / 2 + snap.radius - snap.lip)
            .translate(0, 0, 4 * (snap.lip - EPS) + snap.indent - EPS))
        model = receiver + cap
        return self.apply_label(model, snap.radius + 0.25, self._max_label_radius - 0.25, label)


class FixedBondModel(BondModel):
    """The FixedBondModel class is used to represent a fixed bond between two atoms. This bond is not able to rotate in
    space, so we use a glue joint design to connect the two atoms together.
    """

    def __init__(
        self,
        max_label_radius: float
    ) -> None:
        self._max_label_radius = max_label_radius

    def model(
        self,
        label: Optional[str]
    ):
        """We return the space that the glue joint occupies so that we can subtract it from the atom model."""
        glue_joint = GlueJoint()
        model = glue_joint.receiver_model()
        inner_radius = glue_joint.major_radius + glue_joint.minor_radius + glue_joint.clearance
        return self.apply_label(model, inner_radius + 0.25, self._max_label_radius - 0.25, label)


def bond_model_from_order(bond_order: int, max_label_radius: Optional[float] = None) -> BondModel:
    """This function will return the bond model that corresponds to the given bond order. This allows us to easily
    switch between bond models based on the bond order.
    """
    if bond_order == 0:
        return NoBondModel()

    echeck(max_label_radius is not None, "max_label_radius must be provided for SingleBondModel and FixedBondModel.")
    assert max_label_radius is not None

    if bond_order == 1:
        return SingleBondModel(max_label_radius)
    if bond_order in [2, 3]:
        return FixedBondModel(max_label_radius)

    raise ValueError(f"The bond order {bond_order} is not supported.")
