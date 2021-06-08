#!/bin/sh
CONDA_DIR=~/miniconda3
PACKAGE=$1
VERSION=$2
USER=${3:-edeno}

conda skeleton pypi $PACKAGE --version $VERSION --noarch-python

conda-build $PACKAGE --no-anaconda-upload

anaconda upload $CONDA_DIR/conda-bld/*/$PACKAGE-$VERSION*.tar.bz2 -u $USER --skip

rm -r $PACKAGE
conda build purge-all
