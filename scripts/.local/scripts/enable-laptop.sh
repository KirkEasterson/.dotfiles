#!/usr/bin/env bash

set -euo pipefail

laptop="eDP-1"

if [ -n "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ]; then
	xrandr --output $laptop --auto
else
	wlr-randr --output $laptop --on
fi
