#!/usr/bin/env sh

# NOTE: Manually specifying the current wayland desktop to sway is intentional,
# since flameshot does not yet support river. But it works fine on river ¯\_(ツ)_/¯

gui() {
	flameshot gui
}

window() {
	flameshot full
}

fullscreen() {
	flameshot full
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
