#!/bin/bash

# This script is used to install poetry which is used to manage our python dependencies. If a version argument is
# supplied then this will ensure that version is installed. Otherwise, it will install the latest version. Each project
# should run this script to ensure that the correct version of poetry is installed.

VERSION=$1
VERSION_STRING=""

if [ ! -z "$VERSION" ];
then
    VERSION_STRING="--version $VERSION "
fi

echo "Installing poetry $VERSION_STRING..."
curl -sSL https://install.python-poetry.org | python3 - $VERSION_STRING
