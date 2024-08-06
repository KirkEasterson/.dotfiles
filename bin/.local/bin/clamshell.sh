#!/usr/bin/bash
if grep -q open /proc/acpi/button/lid/LID/state; then
	wlr-randr --output eDP-1 --on
else
	wlr-randr --output eDP-1 --off
fi
