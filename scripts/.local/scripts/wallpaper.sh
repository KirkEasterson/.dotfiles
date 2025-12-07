#!/bin/bash

file="$1"

# check if file has been updated
cmp --silent "${XDG_CONFIG_HOME}/wallpaper" "$file" && exit 0

# set wallpaper
cp "$file" "${XDG_CONFIG_HOME}/wallpaper"

if [ -n "$DISPLAY" ] && [ -n "$WAYLAND_DISPLAY" ]; then
	swaybg --image "${XDG_CONFIG_HOME}/wallpaper" &
	disown
else
	feh --no-fehbg --bg-scale "${XDG_CONFIG_HOME}/wallpaper" &
	disown
fi
notify-send "Wallpaper updated" "Updating themes"

# create color palette
wal \
	-n \
	-a 99 \
	-b "#000000" \
	--saturate 1.0 \
	--contrast 21.0 \
	--cols16 darken \
	-i "$file"

pgrep waybar >/dev/null && "${XDG_CONFIG_HOME}/waybar/start.sh" &
disown

pgrep qutebrowser >/dev/null && qutebrowser darken':config-source' &
disown

pgrep river >/dev/null && "${XDG_CONFIG_HOME}/river/modules/03-theme.sh" &
disown
