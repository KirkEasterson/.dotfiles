#!/bin/sh

set_display() {

	if [ -n "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ]; then
		xrandr |
			grep -v "^ " |
			cut -d " " -f1 |
			xargs -I {} xrandr --output {} --"$1"
	else
		case $XDG_CURRENT_DESKTOP in
		sway|river|qtile)
			wlopm --"$1" "*"
			;;
		Hyprland)
			hyprctl dispatch dpms "$1"
			;;
		esac
	fi

}

case "${1}" in
"on")
	set_display "on"
	;;
"off")
	set_display "off"
	;;
*)
	exit 0
	;;
esac
