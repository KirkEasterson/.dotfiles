#!/usr/bin/bash

laptop="eDP-1"

enable_laptop() {
	if [ -n "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ]; then
		# TODO: not use '--auto'
		xrandr --output $laptop --auto
	else
		wlr-randr --output $laptop --on
	fi
}

disable_laptop() {
	if [ -n "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ]; then
		xrandr --output $laptop --off
	else
		wlr-randr --output $laptop --off
	fi
}

is_lid_open() {
	return $(grep -q open /proc/acpi/button/lid/LID/state)
}

get_num_displays() {
	if [ -n "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ]; then
		num_displays=$(xrandr | sed "1d" | wc -l)
	else
		num_displays=$(wlr-randr | grep -c -v "^ ")
	fi

	echo "$num_displays"
}

# if lid open, enable display and exit
if is_lid_open; then
	enable_laptop
	exit 0
fi

# disable laptop screen
disable_laptop

# if there are more displays connected, then exit
num_displays=$(get_num_displays)
if [ "$num_displays" -ne 0 ]; then
	exit 0
fi

# lock the machine
lock.sh
