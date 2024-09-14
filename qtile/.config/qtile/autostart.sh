#!/bin/bash

if [ -n "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ]; then
	"${XDG_CONFIG_HOME}/polybar/launch.sh" &
else
	"${XDG_CONFIG_HOME}/waybar/start.sh" &
fi
