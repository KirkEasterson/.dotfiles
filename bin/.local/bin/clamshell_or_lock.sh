#!/usr/bin/bash

if grep -q open /proc/acpi/button/lid/LID/state; then
	wlr-randr --output eDP-1 --on
else
	wlr-randr --output eDP-1 --off
	if [ $(wlr-randr | grep -c -v "^ ") -eq 1 ]; then
		lock.sh
	fi
fi
