#!/usr/bin/env sh

if [ -n "$DISPLAY" ] && [ -n "$WAYLAND_DISPLAY" ]; then
	exit 0
else
	exit 1
fi
