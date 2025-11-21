#!/bin/bash

file="$1"

# check if file has been updated
cmp --silent "${XDG_CONFIG_HOME}/wallpaper" "$file" && exit 0

cp "$file" "${XDG_CONFIG_HOME}/wallpaper"
# feh --no-fehbg --bg-scale "${XDG_CONFIG_HOME}/wallpaper" # TODO. check for wayland/x11
swaybg --image "${XDG_CONFIG_HOME}/wallpaper" &
disown

wal -e -n -q --saturate 0.7 -b black -i "$file"

notify-send "Wallpaper updated" "Updating themes"

pgrep waybar >/dev/null && "${XDG_CONFIG_HOME}/waybar/start.sh" &
disown
pgrep qutebrowser >/dev/null && qutebrowser darken':config-source' &
disown
