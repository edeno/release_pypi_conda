#!/bin/sh
CONDA_DIR=~/miniconda3
PACKAGE=$1
VERSION=$2
USER=${3:-edeno}
OS=${4:-osx-64}

conda skeleton pypi $PACKAGE --version $VERSION

echo "PYTHON 3.6"
conda-build $PACKAGE --no-anaconda-upload --python 3.6

echo "PYTHON 3.7"
conda-build $PACKAGE --no-anaconda-upload --python 3.7

echo "PYTHON 3.8"
conda-build $PACKAGE --no-anaconda-upload --python 3.8

conda convert $CONDA_DIR/conda-bld/$OS/$PACKAGE-$VERSION*.tar.bz2 -o $CONDA_DIR/conda-bld/ --platform all
anaconda upload $CONDA_DIR/conda-bld/*/$PACKAGE-$VERSION*.tar.bz2 -u $USER --skip-existing

rm -r $PACKAGE
conda build purge-all
