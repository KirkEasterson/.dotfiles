#!/bin/bash

# NOTE: Manually specifying the current wayland desktop to sway is intentional,
# since flameshot does not yet support river. But it works fine on river ¯\_(ツ)_/¯

gui() {
	if [ -n "$DISPLAY" ] && [ -n "$WAYLAND_DISPLAY" ]; then
		XDG_CURRENT_DESKTOP=sway flameshot gui
	else
		flameshot gui
	fi
}

window() {
	if [ -n "$DISPLAY" ] && [ -n "$WAYLAND_DISPLAY" ]; then
		XDG_CURRENT_DESKTOP=sway flameshot full
	else
		flameshot full
	fi
}

fullscreen() {
	if [ -n "$DISPLAY" ] && [ -n "$WAYLAND_DISPLAY" ]; then
		XDG_CURRENT_DESKTOP=sway flameshot full
	else
		flameshot full
	fi
}

sound() {
	pw-play /usr/share/sounds/freedesktop/stereo/camera-shutter.oga
}

if [ ! -d "${screenshots_dir}" ]; then
	screenshots_dir="$(xdg-user-dir PICTURES)/screenshots"
	mkdir -p "${screenshots_dir}"
fi

case "${1}" in
"gui")
	gui
	;;
"window")
	window
	;;
"fullscreen")
	fullscreen
	;;
*)
	exit 0
	;;
esac

sound
