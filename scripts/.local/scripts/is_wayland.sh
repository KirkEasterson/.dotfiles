#!/usr/bin/env bash

set -euo pipefail

if [ -n "$DISPLAY" ] && [ -n "$WAYLAND_DISPLAY" ]; then
	exit 0
else
	exit 1
fi
