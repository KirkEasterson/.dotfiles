#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
	for m in $(xrandr --listactivemonitors | sed 1,1d | cut -d" " -f6); do
		MONITOR=$m polybar top &
	done
fi
