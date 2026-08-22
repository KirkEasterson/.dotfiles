#!/usr/bin/env bash

set -euo pipefail

get_num_displays() {
	if [ -n "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ]; then
		num_displays=$(xrandr | grep -c " connected")
	else
		num_displays=$(wlr-randr | grep -c -v "^ ")
	fi

	echo -n "$num_displays"
}

num_displays=$(get_num_displays)
if [ "$num_displays" == 1 ]; then
	inhibit-idle.sh off
	loginctl lock-session
fi
