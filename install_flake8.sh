#!/bin/bash

# This script is used to install flake8 which is used in our linting.

if [[ ! -e "$(command -v flake8)" ]]
then
    echo "Installing flake8 ..."
    python3 -m pip install flake8
fi
