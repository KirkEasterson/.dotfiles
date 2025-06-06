#!/usr/bin/env bash

# Inspired by manjaro-sway
#
# https://github.com/manjaro-sway/desktop-settings/blob/sway/community/sway/usr/bin/inhibit-idle

status() {
	pgrep -cf "systemd-inhibit --what=idle"
}

inhibit() {
	if [ $# -eq 0 ]; then
		notify_user "Inhibiting idle"
		num_minutes=$((365 * 24 * 60))
	else
		notify_user "Inhibiting idle for ${num_minutes} minutes"
		num_minutes=$1
	fi

	uninhibit
	systemd-inhibit \
		--what=idle \
		--who=swayidle-inhibit \
		--why=commanded \
		--mode=block sleep $((num_minutes * 60)) &
}

uninhibit() {
	pkill -f "systemd-inhibit --what=idle" || true
}

notify_user() {
	notify-send "$1" -h string:x-canonical-private-synchronous:idle
}

send_signal() {
	bar-signal.sh "idle"
}

case $1'' in
'interactive')
	num_minutes=$(
		printf "1\n10\n15\n30\n60\n90\n120" |
			${SEARCH} -d -p "Number of minutes to inhibit idle:"
	)
	ret_val=$?
	if [ $ret_val -ne 0 ]; then
		exit 0
	fi

	inhibit "$num_minutes"
	send_signal
	;;
'on')
	inhibit
	send_signal
	;;
'off')
	uninhibit
	notify_user "No longer inhibiting idle"
	send_signal
	;;
*)
	num_processes=$(status)
	num_processes="${num_processes//[$'\t\r\n ']/}"
	if [ "$num_processes" -ne "0" ]; then
		class="on"
		text="Inhibiting idle"
	else
		class="off"
		text="Idle not inhibited"
	fi

	printf '{"alt":"%s","class":"%s","tooltip":"%s"}\n' "$class" "$class" "$text"
	;;
esac
