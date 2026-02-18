#!/usr/bin/env bash

outdated=$(brew outdated --quiet | wc -l | tr -d " ")
threshold=10

# only show menubar item above threshold
if [[ $outdated -ge $threshold ]]; then
	LABEL="$outdated"
	ICON=""
fi

sketchybar --set "$NAME" icon="$ICON" label="$LABEL"
