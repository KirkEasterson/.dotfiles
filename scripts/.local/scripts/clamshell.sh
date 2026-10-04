#!/usr/bin/env bash

set -eo pipefail

laptop="eDP-1"

is_lid_closed() {
	grep --quiet --invert-match open /proc/acpi/button/lid/LID/state
}

get_num_displays() {
	if [ -n "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ]; then
    xrandr | grep -c " connected"
	else
    wlr-randr | grep -c -v "^ "
	fi
}

enable_laptop() {
	if [ -n "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ]; then
		# TODO: not use '--auto'
		xrandr --output $laptop --auto
		autorandr --change
	else
		wlr-randr --output $laptop --on
		refresh-kanshi.sh
	fi
}

disable_laptop() {
	if [ -n "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ]; then
		xrandr --output $laptop --off
	else
		wlr-randr --output $laptop --off
	fi
}

if [ "$(get_num_displays)" == 1 ]; then
	if is_lid_closed; then
    lock.sh
		systemctl sleep
	fi
	exit 0
fi

if is_lid_closed; then
	disable_laptop
else
	enable_laptop
fi
