#!/bin/sh

url="https://wttr.in/?format=%c%t&m"
resp=$(wget --content-on-error --server-response -qO- "$url" 2>&1)

status=$(echo "$resp" | head -n 1 | awk -F" " '{print $2}')
content=$(echo "$resp" | tail -n 1)

case "$status" in
"200")
	case "$content" in
	*"Unknown location"*)
		printf ""
		;;
	*)
		printf "%s" "$content"
		;;
	esac
	;;
*)
	printf ""
	;;
esac
