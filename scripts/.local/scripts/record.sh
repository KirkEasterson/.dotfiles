#!/bin/sh

send_signal() {
	bar-signal.sh "recorder"
}

update_icon() {
	echo "$1" >/tmp/recordingicon
	# pkill -RTMIN+9 "${STATUSBAR:-dwmblocks}"
}

kill_recording() {
	recpid="$(cat /tmp/recordingpid)"
	kill -15 "$recpid"
	rm -f /tmp/recordingpid

	# update_icon ""
	class="off"
	text="Not recording"
}

screen() {
	file="${screencasts_dir}/$(date '+%y-%m-%d_%H-%M-%S').${file_type}"
	wf-recorder --file="${file}" &
	echo $! >/tmp/recordingpid

	# update_icon "⏺️🎙️"
	class="screen"
	text="Recording screen"
}

screen_and_audio() {
	file="${screencasts_dir}/$(date '+%y-%m-%d_%H-%M-%S').${file_type}"
	wf-recorder --audio --file="${file}" &
	echo $! >/tmp/recordingpid

	# update_icon "⏺️🎙️"
	class="screen_and_audio"
	text="Recording screen with audio"
}

screen_selection() {
	file="${screencasts_dir}/$(date '+%y-%m-%d_%H-%M-%S').${file_type}"
	wf-recorder -g "$(slurp)" --file="${file}" &
	echo $! >/tmp/recordingpid

	# update_icon "⏺️🎙️"
	class="screen_selection"
	text="Recording screen selection"
}

webcam() {
	file="${screencasts_dir}/$(date '+%y-%m-%d_%H-%M-%S')"

	# mpv /dev/video0 \
	# 	--profile=low-latency \
	# 	--untimed \
	# 	--no-osc \
	# 	--title=webcam-on-screen &

	ffmpeg \
		-i /dev/video0 \
		"${file}.${file_type}" &

	echo $! >/tmp/recordingpid

	# update_icon "🎥"
	class="webcam"
	text="Recording from webcam"
}

prompt_end() {
	response=$(printf "No\\nYes" |
		$SEARCH -d -i -p "Recording still active. End recording?") &&
		[ "$response" = "Yes" ] && kill_recording
}

prompt_recording() {
	choice=$(printf "screen\\nscreen_and_audio\\nscreen_selection\\nwebcam" |
		$SEARCH -d -i -p "Select recording style:")

	case "$choice" in
	screen) screen ;;
	screen_and_audio) screen_and_audio ;;
	screen_selection) screen_selection ;;
	# audio) audio;;
	webcam) webcam ;;
	*)
		class="off"
		text="Not recording"
		;;
	esac
}

file_type="mp4"
screencasts_dir="${HOME}/Videos/screen_recordings"

if [ ! -d "${screencasts_dir}" ]; then
	mkdir -p "${screencasts_dir}"
fi

case "$1" in
screen) screen ;;
screen_and_audio) screen_and_audio ;;
screen_selection) screen_selection ;;
# audio) audio;;
webcam) webcam ;;
kill) kill_recording ;;
*) ([ -f /tmp/recordingpid ] && prompt_end) || prompt_recording ;;
esac

printf '{"alt":"%s","tooltip":"%s"}\n' "$class" "$text"
send_signal
