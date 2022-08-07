#!/bin/bash

# TODO: set an environment variable for $DOTFILES and use that

# TODO: use a map instead of an array
# contents to ignore when making sym links
ign_files=(
	".git"
	".gitignore"
	"README.md"
	"clean.sh"
	"install.sh"
)

# add name of script dynamically in case the name is changed
ign_files+=(`basename "$0"`)

# name of directory that this script is in, so it can be run from anywhere
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# iterate through contents of script directory
# TODO: make this work for already existing directories
for entry in `ls -aA $SCRIPT_DIR`; do
	# if current entry is not in the ignore list
	if ! [[ ${ign_files[*]} =~ (^|[[:space:]])"$entry"($|[[:space:]]) ]]; then
		# create sym link
		ln -sfn $(SCRIPT_DIR)/"$entry" $HOME/"$entry"
	fi
done

mkdir -p ~/.cache/zsh
touch ~/.cache/zsh/history
