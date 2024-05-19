#
# bond.py
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#

from abc import abstractmethod
from solid2 import cube


class BondModel:
    """This is the abstract class for a bond model. It is used to define the shape of the bond between two atoms. This
    allows us to define different subclasses for different types of bonds between atoms.
    """
    @abstractmethod
    def model(self):
        pass


class NoBondModel(BondModel):
    """THe NoBondModel class is used to represent a bond that does not exist between two atoms, That is, the two atoms
    are neighbors but they are not bonded together.
    """
    def __init__(self):
        pass

    def model(self):
        """We have to return something, so we return a cube with no size."""
        return cube(0)
