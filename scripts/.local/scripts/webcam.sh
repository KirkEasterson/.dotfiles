#!/bin/sh

show() {
	echo "showing"
	mpv /dev/video0 \
		--profile=low-latency \
		--untimed \
		--no-osc \
		--geometry=-0-0 \
		--autofit=20% \
		--title=webcam-on-screen
}

hide() {
	echo "hiding"
	pkill -f /dev/video
}

hide || show
