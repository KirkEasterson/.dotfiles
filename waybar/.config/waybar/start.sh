#!/usr/bin/env sh

if [ $(pgrep waybar) ]; then
  killall -q waybar
  # wait until the process has been shut down
  while pgrep -x waybar >/dev/null; do sleep 1; done
fi

waybar
