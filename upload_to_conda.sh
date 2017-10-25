#!/bin/sh
CONDA_DIR=~/miniconda3
PACKAGE=$1
VERSION=$2

conda skeleton pypi $PACKAGE
conda build $PACKAGE --no-anaconda-upload
anaconda upload $CONDA_DIR/conda-bld/osx-64/$PACKAGE-$VERSION*.tar.bz2 --all

rm -r $PACKAGE
