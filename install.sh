#!/bin/bash

# TODO: set an environment variable for $DOTFILES and use that

# TODO: use a map instead of an array
# contents to ignore when making sym links
ign_files=(
		"."
		".."
		".git"
		"README.md"
)

# add name of script dynamically in case the name is changed
ign_files+=(`basename "$0"`)

# iterate through contents of current directory
for entry in `ls -a`; do

		# if current entry is not in the ignore list
		if ! [[ ${ign_files[*]} =~ (^|[[:space:]])"$entry"($|[[:space:]]) ]]; then

				# create sym link
				ln -s -f $(pwd)/"$entry" $HOME/"$entry"
		fi
done
