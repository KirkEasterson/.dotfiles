#!/bin/bash

CAFFINATE_ID=$(pgrep caffeinate)
SLEEP_ICON="󰒲"
AWAKE_ICON="󰒳"

toggle_caffeine() {
	if [ -n "$CAFFINATE_ID" ]; then
		pkill caffeinate
	else
		caffeinate -id &
		disown
	fi
}

# if a mouse click, then toggle caffeine
if [ -n "$BUTTON" ]; then
	toggle_caffeine
fi

# if caffeine is running
if [ -n "$CAFFINATE_ID" ]; then
	ICON="$AWAKE_ICON"
else
	ICON="$SLEEP_ICON"
fi

sketchybar --set "$NAME" icon="$ICON"
exit 0
