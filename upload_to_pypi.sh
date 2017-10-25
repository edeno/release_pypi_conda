#!/bin/sh

# Upload to pypi
git clean -xfd
python setup.py sdist bdist_wheel --universal
twine upload dist/*
