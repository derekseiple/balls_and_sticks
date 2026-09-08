#!/bin/bash

set -e

# Gets the directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Make sure pyenv is initialized.
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Make sure the python version in the .python-version file is installed
if [ -f ".python-version" ]; then
    python_version=$(cat .python-version)
    pyenv install --skip-existing $python_version
else
    echo "No .python-version file found"
    exit 1
fi

# Install the proper version of poetry and then install the dependencies
poetry_version=""
if [ -f ".poetry-version" ]; then
    poetry_version=$(cat .poetry-version)
    echo "Using poetry version $poetry_version from .poetry-version file..."
else
    echo "No .poetry-version file found"
    exit 1
fi

# Install flake8
$DIR/install_flake8.sh

# Install and setup poetry project
$DIR/install_poetry.sh $poetry_version
poetry install --no-root

# Linting...
poetry run flake8 --config=$DIR/.flake8 --exclude=.venv,__pycache__ ./

# Type checking...
poetry run mypy --config-file $DIR/.mypy.ini --warn-unused-configs --show-error-codes --exclude .venv ./

# Unit testing...
poetry run python -m unittest -f
