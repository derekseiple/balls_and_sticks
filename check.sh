#!/bin/bash

set -e

# Gets the directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Install flake8
$DIR/install_flake8.sh

# Install and setup poetry project
$DIR/install_poetry.sh 1.8.3
poetry install --no-root

# Linting...
poetry run flake8 --config=$DIR/.flake8 --exclude=.venv,__pycache__ ./

# Type checking...
poetry run mypy --config-file $DIR/.mypy.ini --warn-unused-configs --show-error-codes --exclude .venv ./

# Unit testing...
poetry run python -m unittest -f
