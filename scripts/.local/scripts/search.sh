#!/bin/sh

case "$SEARCH" in
"rofi")
	rofi -show drun "$@"
	;;
"fuzzel")
	fuzzel "$@"
	;;
*)
	exit 0
	;;
esac
