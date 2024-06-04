#!/bin/sh

# TODO: add option to toggle window

mpv /dev/video0 \
	--profile=low-latency \
	--untimed \
	--no-osc \
	--title=webcam-on-screen
