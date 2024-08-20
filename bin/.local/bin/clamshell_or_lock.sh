#!/usr/bin/bash

get_num_displays() {
	if [ -n "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ]; then
		num_displays=$(xrandr | grep -c " connected")
	else
		num_displays=$(wlr-randr | grep -c -v "^ ")
	fi

	echo "$num_displays"
}

clamshell.sh

# exit if there are other displays enabled
num_displays=$(get_num_displays)
if [ "$num_displays" -ne 0 ]; then
	exit 0
fi

# lock the machine
lock.sh
