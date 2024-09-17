#!/bin/sh

# This script serves as a wrapper for setting keyboard layouts in different
# desktop environments.

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
	case $XDG_CURRENT_DESKTOP in
	sway)
		swaymsg input type:keyboard xkb_layout "$1"
		;;
	river)
		riverctl keyboard-layout -options "caps:escape" "$1"
		;;
	qtile)
		qtile cmd-obj -o core -f set_keymap -a "$1" "caps:escape"
		;;
	esac

else
	setxkbmap -option "caps:escape" "$1"
fi
