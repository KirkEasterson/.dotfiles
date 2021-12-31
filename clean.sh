#!/bin/bash

# TODO: use environment variable $DOTFILES
# TODO: find a more elegant way to redirect output

git stash > /dev/null 2>&1
git checkout master > /dev/null 2>&1
./install.sh
