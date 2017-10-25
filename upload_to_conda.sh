#!/bin/sh
CONDA_DIR=~/miniconda3
PACKAGE=$1
VERSION=$2

conda skeleton pypi $PACKAGE
conda build $PACKAGE --no-anaconda-upload

rm -r $PACKAGE
