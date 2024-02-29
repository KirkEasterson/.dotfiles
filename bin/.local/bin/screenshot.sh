#!/bin/bash

gui () {
	if [ -n "$DISPLAY" ] && [ -n "$WAYLAND_DISPLAY" ]; then
		grim -g "$(slurp -b 00000090 -s cc000000 -w 0)" "${output_file}"
	else
		flameshot gui
	fi
}

window () {
	if [ -n "$DISPLAY" ] && [ -n "$WAYLAND_DISPLAY" ]; then
		# TODO: this line without jq
		grim -g "$(swaymsg -t get_tree | jq -j '.. | select(.type?) | select(.focused).rect | "\(.x),\(.y) \(.width)x\(.height)"')" "${output_file}"
	else
		flameshot full
	fi
}

fullscreen () {
	if [ -n "$DISPLAY" ] && [ -n "$WAYLAND_DISPLAY" ]; then
		# TODO: this line without jq
		grim "${output_file}"
	else
		flameshot full
	fi
}

sound () {
	pw-play /usr/share/sounds/freedesktop/stereo/camera-shutter.oga
}

screenshots_dir="$(xdg-user-dir PICTURES)/screenshots"
output_file="${screenshots_dir}/$(date '+%F_%H:%M:%S').png"
mkdir -p "${screenshots_dir}"

case "${1}" in
	("gui")
		gui
		;;
	("window")
		window
		;;
	("fullscreen")
		fullscreen
		;;
	(*)
		exit 0
esac

sound
