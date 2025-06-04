#!/bin/bash

file="$1"

cp "$1" "${XDG_CONFIG_HOME}/wallpaper"
wal -e -i "$file" --theme "base16-gruvbox-hard"

notify-send "Wallpaper updated" "Updating themes"

pgrep waybar >/dev/null && "${XDG_CONFIG_HOME}/waybar/start.sh" & disown
pgrep qutebrowser >/dev/null && qutebrowser ':config-source'
