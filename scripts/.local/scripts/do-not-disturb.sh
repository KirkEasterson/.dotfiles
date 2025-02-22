#!/bin/bash

enable() {
	case $NOTIFIER in
	"dunst")
		dunstctl set-paused true
		;;
	"mako")
		makoctl mode -s do-not-disturb
		;;
	esac
}

disable() {
	case $NOTIFIER in
	"dunst")
		dunstctl set-paused false
		;;
	"mako")
		makoctl mode -r do-not-disturb
		;;
	esac
}

toggle() {
	case $NOTIFIER in
	"dunst")
		dunstctl set-paused toggle
		;;
	"mako")
		makoctl mode -t do-not-disturb
		;;
	esac
}

status() {
	case $NOTIFIER in
	"dunst")
		if dunstctl is-paused; then
			STATUS="enabled"
		else
			STATUS="disabled"
		fi
		;;
	"mako")
		if makoctl mode | grep -q "do-not-disturb"; then
			STATUS="enabled"
		else
			STATUS="disabled"
		fi
		;;
	esac

	echo -n "$STATUS"
}

send_signal() {
	bar-signal.sh "disturb"
}

if pgrep -x "dunst" >/dev/null; then
	NOTIFIER="dunst"
elif pgrep -x "mako" >/dev/null; then
	NOTIFIER="mako"
else
	exit 0
fi

case "$1" in
"enable")
	enable
	send_signal
	;;
"disable")
	disable
	send_signal
	;;
"toggle")
	toggle
	send_signal
	;;
*)
	enabled=$(status)
	case $enabled in
	"enabled")
		class="on"
		text="Notifications disabled"
		;;
	"disabled")
		class="off"
		text="Notifications enabled"
		;;
	esac

	printf '{"alt":"%s","tooltip":"%s"}\n' "$class" "$text"
	;;
esac
