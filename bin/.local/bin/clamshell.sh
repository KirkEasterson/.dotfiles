#!/usr/bin/bash

laptop="eDP-1"

is_lid_open() {
	return "$(grep -q open /proc/acpi/button/lid/LID/state)"
}

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

if is_lid_open; then
	enable_laptop
else
	disable_laptop
fi
