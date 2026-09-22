#
# direction.py
#
# Copyright © 2026 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#


class Direction:
    """A direction in space, given by inclination and azimuthal angles in degrees."""

    def __init__(self, inclination: float, azimuthal: float):
        # inclination angles must lie between -90 and +90 degrees
        if inclination < -90 or inclination > 90:
            raise ValueError(
                "Inclination angle must be between -90 and +90 degrees, but got: {}".format(inclination))
        # azimuthal angles must lie between -180 and +180 degrees
        if azimuthal < -180 or azimuthal > 180:
            raise ValueError(
                "Azimuthal angle must be between -180 and +180 degrees, but got: {}".format(azimuthal))
        self._inclination = inclination
        self._azimuthal = azimuthal

    @property
    def inclination(self) -> float:
        return self._inclination

    @property
    def azimuthal(self) -> float:
        return self._azimuthal
