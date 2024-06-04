#!/bin/sh

getdim() {
	xrandr \
		| grep -oP '(?<=current ).*(?=,)' \
		| tr -d ' '
}

updateicon() { \
	echo "$1" > /tmp/recordingicon
	# pkill -RTMIN+9 "${STATUSBAR:-dwmblocks}"
}

killrecording() {
	recpid="$(cat /tmp/recordingpid)"
	kill -15 "$recpid"
	rm -f /tmp/recordingpid
	updateicon ""
	# pkill -RTMIN+9 "${STATUSBAR:-dwmblocks}"
}

screen() { \
	file="${screencasts_dir}/$(date '+%y-%m-%d_%H-%M-%S').mkv"
	wf-recorder --file="${file}" &
	echo $! > /tmp/recordingpid
	updateicon "⏺️🎙️"
}

screen_and_audio() { \
	file="${screencasts_dir}/$(date '+%y-%m-%d_%H-%M-%S').mkv"
	wf-recorder --audio --file="${file}" &
	echo $! > /tmp/recordingpid
	updateicon "⏺️🎙️"
}

screen_selection() { \
	file="${screencasts_dir}/$(date '+%y-%m-%d_%H-%M-%S').mkv"
	wf-recorder -g "$(slurp)" --file="${file}" &
	echo $! > /tmp/recordingpid
	updateicon "⏺️🎙️"
}

# video() {
# 	file="${screencasts_dir}/$(date '+%y-%m-%d_%H-%M-%S')"
# 	wf-recorder --file="${file}" &
# 	echo $! > /tmp/recordingpid
# 	updateicon "⏺️"
# }

webcam() {
	file="${screencasts_dir}/$(date '+%y-%m-%d_%H-%M-%S')"

	# mpv /dev/video0 \
	# 	--profile=low-latency \
	# 	--untimed \
	# 	--no-osc \
	# 	--title=webcam-on-screen &

	ffmpeg \
		-i /dev/video0 \
		"${file}.mkv" &

	echo $! > /tmp/recordingpid
	updateicon "🎥"
}


asktoend() { \
	response=$(printf "No\\nYes" \
		| $SEARCH -d -i -p "Recording still active. End recording?") &&
	[ "$response" = "Yes" ] && killrecording
}

askrecording() { \
	choice=$(printf "screen\\nscreen_and_audio\\nscreen_selection\\nwebcam" \
		| $SEARCH -d -i -p "Select recording style:")

	case "$choice" in
		screen) screen;;
		screen_and_audio) screen_and_audio;;
		screen_selection) screen_selection;;
		# audio) audio;;
		webcam) webcam;;
		*) exit 0
	esac
}

screencasts_dir="${HOME}/Videos/screen_recordings"

if [ ! -d "${screencasts_dir}" ]; then
	mkdir -p "${screencasts_dir}"
fi

case "$1" in
	screen) screen;;
	screen_and_audio) screen_and_audio;;
	screen_selection) screen_selection;;
	# audio) audio;;
	webcam) webcam;;
	kill) killrecording;;
	*) ([ -f /tmp/recordingpid ] && asktoend && exit) || askrecording;;
esac
