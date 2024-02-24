#!/bin/bash

if [ -n "$DISPLAY" ] && [ -n "$WAYLAND_DISPLAY" ]; then
	flameshot -gui
else
	# wayland
fi

return 0
