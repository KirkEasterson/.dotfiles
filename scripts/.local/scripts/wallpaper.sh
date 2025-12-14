#!/bin/bash

file="$1"

# check if file has been updated
cmp --silent "${XDG_CONFIG_HOME}/wallpaper" "$file" && exit 0

# set wallpaper
cp "$file" "${XDG_CONFIG_HOME}/wallpaper"

if [ -n "$DISPLAY" ] && [ -n "$WAYLAND_DISPLAY" ]; then
	swaybg -m stretch --image "${XDG_CONFIG_HOME}/wallpaper" &
	disown
else
	feh --no-fehbg --bg-scale "${XDG_CONFIG_HOME}/wallpaper" &
	disown
fi
notify-send "Wallpaper updated"
