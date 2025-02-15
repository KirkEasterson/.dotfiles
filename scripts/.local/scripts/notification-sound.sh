#!/bin/bash

case "${1}" in
"information")
	pw-play /usr/share/sounds/freedesktop/stereo/dialog-information.oga &
	;;
"warning")
	pw-play /usr/share/sounds/freedesktop/stereo/dialog-warning.oga &
	;;
"error")
	pw-play /usr/share/sounds/freedesktop/stereo/dialog-error.oga &
	;;
*)
	exit 0
	;;
esac
