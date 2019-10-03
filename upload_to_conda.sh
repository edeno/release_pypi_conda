#!/bin/sh
CONDA_DIR=~/miniconda3
PACKAGE=$1
VERSION=$2
USER=${3:-edeno}
OS=${4:-osx-64}

conda skeleton pypi $PACKAGE --version $VERSION
conda-build $PACKAGE --no-anaconda-upload
conda convert $CONDA_DIR/conda-bld/$OS/$PACKAGE-$VERSION*.tar.bz2 -o $CONDA_DIR/conda-bld/ --platform all
anaconda upload $CONDA_DIR/conda-bld/*/$PACKAGE-$VERSION*.tar.bz2 -u $USER

rm -r $PACKAGE
conda build purge
