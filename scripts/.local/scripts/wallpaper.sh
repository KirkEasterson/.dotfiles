#!/bin/bash

file="$1"

cp "$1" "${XDG_CONFIG_HOME}/wallpaper"
wal -i "$file" --theme "base16-gruvbox-hard"

notify-send "Wallpaper updated" "Updating themes"

# TODO: restart programs
#	- terminal
#	- vim

pgrep qutebrowser > /dev/null && qutebrowser ':config-source'
