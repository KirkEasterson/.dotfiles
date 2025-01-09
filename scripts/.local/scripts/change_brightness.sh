#!/bin/bash

brightness_diff="5"
min_brightness="0"

raise_brightness() {
	brightnessctl set ${brightness_diff}%+ -n ${min_brightness}
}

lower_brightness() {
	brightnessctl set ${brightness_diff}%- -n ${min_brightness}
}

get_brightness() {
	echo "$1" | sed -n 's/.*Current brightness: [0-9]* (\([0-9]*\).*/\1/p'
}

get_icon() {
	echo "video-display"
}

notify_user() {
	brightness=$(get_brightness "$1")
	icon=$(get_icon "$brightness")

	notify-send "Brightness" \
		-u "low" \
		-i "$icon" \
		-h "int:value:${brightness}" \
		-h "string:x-canonical-private-synchronous:sys-notify"
}

case "${1}" in
"raise")
	output=$(raise_brightness)
	;;
"lower")
	output=$(lower_brightness)
	;;
*)
	exit 0
	;;
esac

notify_user "$output"
