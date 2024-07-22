#!/bin/sh

# This script serves as a wrapper for setting keyboard layouts in different
# desktop environments.

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
	# TODO: filter on different compositors
	swaymsg input type:keyboard xkb_layout "$1" || true
	riverctl keyboard-layout -options "caps:escape" "$1" || true
else
	setxkbmap "${1}"
fi
