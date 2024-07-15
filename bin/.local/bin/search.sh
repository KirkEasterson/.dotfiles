#!/bin/sh

if [ -n "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ]; then
	$SEARCH -show drun
else
	$SEARCH
fi
