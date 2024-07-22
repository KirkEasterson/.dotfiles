#!/usr/bin/bash
if grep -q open /proc/acpi/button/lid/LID/state; then
	wlr-randr --output DP-1 --on
else
	wlr-randr --output DP-1 --off
fi
