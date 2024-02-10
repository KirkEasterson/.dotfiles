#!/bin/sh

LOCK_IMG=${XDG_CONFIG_HOME}/lock.png
SCREEN_RESOLUTION="$(xdpyinfo | grep dimensions | cut -d' ' -f7)"
BGCOLOR="#000000"
# convert "$XDG_CONFIG_HOME/lock.png" -gravity Center -extent "$SCREEN_RESOLUTION" RGB:- | i3lock --ignore-empty-password --show-failed-attempts --beep --raw "$SCREEN_RESOLUTION":rgb -c 000000 -i /dev/stdin

if [ -n "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ]; then
	convert $LOCK_IMG -gravity Center -background \
		$BGCOLOR -extent "$SCREEN_RESOLUTION" RGB:- \
		| i3lock --ignore-empty-password --show-failed-attempts --beep --nofork \
		--raw "$SCREEN_RESOLUTION":rgb -c $BGCOLOR -i /dev/stdin
else
	swaylock
fi

