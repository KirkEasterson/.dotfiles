#!/usr/bin/env sh

if [ -n "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ]; then
  autorandr --change
else
  pgrep kanshi | xargs kill -HUP
fi
