#!/bin/bash

SLEEP_ICON="󰒲"
AWAKE_ICON="󰒳"

caffeinate_id() {
	pgrep caffeinate
}

start_caffeinate() {
	### Copied from `man caffeinate`
	#
	# -d      Create an assertion to prevent the display from sleeping.
	#
	# -i      Create an assertion to prevent the system from idle sleeping.
	#
	# -m      Create an assertion to prevent the disk from idle sleeping.
	#
	# -s      Create an assertion to prevent the system from sleeping. This
	#         assertion is valid only when system is running on AC power.
	#
	# -u      Create an assertion to declare that user is active. If the
	#         display is off, this option turns the display on and prevents
	#         the display from going into idle sleep. If a timeout is not
	#         specified with '-t' option, then this assertion is taken with
	#         a default of 5 second timeout.
	caffeinate -dimsu &
	disown
}

stop_caffeinate() {
	pkill caffeinate
}

toggle_caffeinate() {
	if [ -z "$(caffeinate_id)" ]; then
		start_caffeinate
	else
		stop_caffeinate
	fi
}

# if a mouse click, then toggle caffeinate
if [ -n "$BUTTON" ]; then
	toggle_caffeinate
fi

# if caffeinate is running
if [ -n "$(caffeinate_id)" ]; then
	ICON="$AWAKE_ICON"
else
	ICON="$SLEEP_ICON"
fi

sketchybar --set "$NAME" icon="$ICON"
exit 0
