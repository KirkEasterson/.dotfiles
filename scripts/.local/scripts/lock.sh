#!/bin/sh

if [ -n "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ]; then
	LOCK_IMG="${XDG_CONFIG_HOME}/lock.png"
	SCREEN_RESOLUTION="$(xdpyinfo | grep dimensions | cut -d' ' -f7)"
	BGCOLOR="#000000"

	magick "$LOCK_IMG" \
		-gravity Center \
		-background "$BGCOLOR" \
		-resize "$SCREEN_RESOLUTION"! RGB:- \
	| i3lock \
		--ignore-empty-password \
		--nofork \
		--beep \
		--raw "$SCREEN_RESOLUTION":rgb \
		--image="/dev/stdin" \
		--color="#000000" \
		--tiling \
		--show-failed-attempts \
		--show-keyboard-layout
else
	swaylock
fi
