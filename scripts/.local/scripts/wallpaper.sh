#!/bin/bash

file="$1"

cp "$1" "${XDG_CONFIG_HOME}/wallpaper"
wal -i "$file" --theme "base16-gruvbox-hard"

notify-send "Wallpaper updated" "Updating themes"

# pgrep river > /dev/null && ${XDG_CONFIG_HOME}/river/init
pgrep qutebrowser > /dev/null && qutebrowser ':config-source'
