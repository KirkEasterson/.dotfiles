#!/usr/bin/env bash

outdated=$(brew outdated --quiet | wc -l | tr -d " ")
threshold=0

# only show menubar item above threshold
if [[ $outdated -gt $threshold ]]; then
	label="$outdated"
	icon=" "
fi

sketchybar --set "$NAME" icon="$icon" label="$label"
