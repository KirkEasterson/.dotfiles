#!/bin/sh

# This script serves as a wrapper for setting keyboard layouts in different
# desktop environments.

xkb_options="caps:escape"

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
	case $XDG_CURRENT_DESKTOP in
	sway)
		swaymsg input type:keyboard xkb_layout "$1"
		;;
	river)
		riverctl keyboard-layout -options "${xkb_options}" "$1"
		;;
	qtile)
		qtile cmd-obj -o core -f set_keymap -a "$1" "${xkb_options}"
		;;
	Hyprland)
		hyprctl --batch "keyword input:kb_layout ${1} ; keyword input:kb_options ${xkb_options}"
		;;
	esac

else
	setxkbmap -option "${xkb_options}" "$1"
fi
