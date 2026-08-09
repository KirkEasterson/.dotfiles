#!/usr/bin/env bash

outdated=$(brew outdated --quiet | wc -l | tr -d " ")
threshold=10

# only show menubar item above threshold
if [[ $outdated -ge $threshold ]]; then
	sketchybar --set "$NAME" icon="" label="$outdated"
else
	sketchybar --set "$NAME" drawing=off
fi
