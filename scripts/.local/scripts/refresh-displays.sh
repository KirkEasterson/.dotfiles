#!/usr/bin/env sh

if [ -n "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ]; then
  autorandr --change
else
  systemctl --user restart kanshi.service
fi
