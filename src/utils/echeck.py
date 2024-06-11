#
# echeck.py
#
#
# Copyright © 2024 Derek Seiple
# Licensed under Creative Commons BY-NC-SA 3.0. See license file.
#


def echeck(expr: bool, msg: str = ""):
    if not expr:
        raise ValueError(msg)
