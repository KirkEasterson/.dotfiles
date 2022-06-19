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

# iterate through contents of current directory
# TODO: make this work for already existing directories
for entry in `ls -aA`; do

		# if current entry is not in the ignore list
		if ! [[ ${ign_files[*]} =~ (^|[[:space:]])"$entry"($|[[:space:]]) ]]; then

				# create sym link
				ln -sfn $(pwd)/"$entry" $HOME/"$entry"
		fi
done

