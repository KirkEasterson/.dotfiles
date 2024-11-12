#!/usr/bin/env bash

# Inspired by manjaro-sway
#
# https://github.com/manjaro-sway/desktop-settings/blob/sway/community/sway/usr/bin/inhibit-idle

status() {
	pgrep -cf "systemd-inhibit --what=idle"
}

inhibit() {
	if [ $# -eq 0 ]; then
		notify-send "Inhibiting idle" -h string:x-canonical-private-synchronous:idle
		num_minutes=$((365 * 24 * 60))
	else
		notify-send "Inhibiting idle for ${num_minutes} minutes" -h string:x-canonical-private-synchronous:idle
		num_minutes=$1
	fi

	uninhibit
	systemd-inhibit --what=idle --who=swayidle-inhibit --why=commanded --mode=block sleep $((num_minutes * 60)) &
}

uninhibit() {
	pkill -f "systemd-inhibit --what=idle" || true
}

send_signal() {
	bar-signal.sh "idle"
}

case $1'' in
'interactive')
	num_minutes=$(printf "1\n10\n15\n20\n30\n45\n60\n90\n120" | ${SEARCH} -d -p "Number of minutes to inhibit idle:")
	ret_val=$?
	if [ $ret_val -ne 0 ]; then
		exit 0
	fi
	inhibit "$num_minutes"
	send_signal
	exit 0
	;;
'on')
	inhibit
	send_signal
	exit 0
	;;
'off')
	uninhibit
	notify-send "No longer inhibiting idle" -h string:x-canonical-private-synchronous:idle
	send_signal
	exit 0
	;;
*)
	num_processes=$(status)
	num_processes="${num_processes//[$'\t\r\n ']/}"
	if [ "$num_processes" -ne "0" ]; then
		class="on"
		text="Inhibiting idle (mid click to clear)"
	else
		class="off"
		text="Idle not inhibited"
	fi
	;;
esac

printf '{"alt":"%s","tooltip":"%s"}\n' "$class" "$text"
