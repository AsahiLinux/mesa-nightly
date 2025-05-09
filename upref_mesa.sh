#!/bin/sh

set -e

# check for clean working tree
git status -su no

# update mesa submodule
git submodule update --remote --checkout mesa

MESA_REF="$(GIT_DIR=mesa/.git git describe --always)"
git add mesa
git commit -s -m "upref mesa to $MESA_REF"

if [ x"${1}" = x"-p" ]; then
    git push
fi
