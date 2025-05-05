#!/bin/sh

send_signal() {
	bar-signal.sh "recorder"
}

status() {
	recpid="$(cat /tmp/recordingpid 2>/dev/null)"
	if [ -z "$recpid" ]; then
		class="off"
		text="Not recording"
	else
		class="$(cat /tmp/recordingtype)"
		text="$(tr '_' ' ' </tmp/recordingtype)"
	fi

	printf '{"alt":"%s","class":"%s","tooltip":"%s"}\n' "$class" "$class" "$text"
}

kill_recording() {
	recpid="$(cat /tmp/recordingpid)"
	kill -15 "$recpid"
	rm -f /tmp/recordingpid
	notify-send "Recording" "Recording ended"
}

screen() {
	wf-recorder --file="${filename}" &
	echo $! >/tmp/recordingpid
	echo "screen" >/tmp/recordingtype
	notify-send "Recording" "Recording screen"
}

screen_and_audio() {
	wf-recorder --audio --file="${filename}" &
	echo $! >/tmp/recordingpid
	echo "screen_and_audio" >/tmp/recordingtype
	notify-send "Recording" "Recording screen and audio"
}

screen_selection() {
	wf-recorder -g "$(slurp)" --file="${filename}" &
	echo $! >/tmp/recordingpid
	echo "screen_selection" >/tmp/recordingtype
	notify-send "Recording" "Recording screen selection"
}

webcam() {
	ffmpeg \
		-i /dev/video0 \
		"${filename}" &

	echo $! >/tmp/recordingpid
	echo "webcam" >/tmp/recordingtype
	notify-send "Recording" "Recording webcam"
}

prompt_end() {
	response=$(printf "Yes\\nNo" |
		$SEARCH -dmenu -p "Recording still active. End recording?") &&
		[ "$response" = "Yes" ] && kill_recording
}

prompt_recording() {
	choice=$(printf "screen\\nscreen_and_audio\\nscreen_selection\\nwebcam" |
		$SEARCH -dmenu -p "Select recording:")

	case "$choice" in
	screen) screen ;;
	screen_and_audio) screen_and_audio ;;
	screen_selection) screen_selection ;;
	# audio) audio;;
	webcam) webcam ;;
	*) exit 1 ;;
	esac
}

screencasts_dir="${HOME}/Videos/screen_recordings"
file_type="mp4"
filename="${screencasts_dir}/$(date '+%y-%m-%d_%H-%M-%S').${file_type}"

if [ ! -d "${screencasts_dir}" ]; then
	mkdir -p "${screencasts_dir}"
fi

case "$1" in
"screen") screen ;;
"screen_and_audio") screen_and_audio ;;
"screen_selection") screen_selection ;;
# audio) audio;;
"webcam") webcam ;;
"kill") kill_recording ;;
"prompt") ([ -f /tmp/recordingpid ] && prompt_end) || prompt_recording ;;
*) status ;;
esac

send_signal
