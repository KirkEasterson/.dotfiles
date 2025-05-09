#!/bin/sh

case "$SEARCH" in
"rofi")
	rofi -show drun -monitor -1 "$@"
	;;
"fuzzel")
	fuzzel "$@"
	;;
*)
	exit 0
	;;
esac
