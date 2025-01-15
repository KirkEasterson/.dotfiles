#!/bin/sh

set_display() {

	if [ -n "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ]; then
		xrandr |
			grep -v "^ " |
			cut -d " " -f1 |
			xargs -I {} xrandr --output {} --"$1"
	else
		wlr-randr |
			grep -v "^ " |
			cut -d " " -f1 |
			xargs -I {} wlr-randr --output {} --"$1"
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
