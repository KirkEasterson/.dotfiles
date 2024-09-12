#!/bin/bash

if [ -n "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ]; then
	"${XDG_CONFIG_HOME}/polybar/launch.sh" &
	"${HOME}/.fehbg" &
else
	"${XDG_CONFIG_HOME}/waybar/start.sh" &
	swaybg --image "${XDG_CONFIG_HOME}/wall.png"
fi
