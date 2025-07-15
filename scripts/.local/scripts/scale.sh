#!/bin/sh

if [ ! -x "$(command -v wlr-randr)" ]; then
	echo "wlr-randr not installed"
	exit 1
fi

INCREMENT=0.1
names=$(wlr-randr --json | jq -r '.[] | select(.enabled==true) | .name')

current_scale() {
	wlr-randr --json | jq -r '[.[] | select(.enabled==true)][0] | .scale'
}

scale() {
	echo "$names" | xargs -0 -d "\n" -I name \
		wlr-randr --output name --scale "$1"
}

case $1'' in
'')
	current_scale
	;;
'reset')
	scale 1
	;;
'up')
	scale "$(echo "$(current_scale) + $INCREMENT" | bc)"
	;;
'down')
	scale "$(echo "$(current_scale) - $INCREMENT" | bc)"
	;;
esac
