#!/bin/sh

device_name="platform-i8042-serio-0-event-kbd"

if [ -e "/dev/input/by-path/${device_name}" ]; then
	kmonad "${HOME}/.config/kmonad/config.kbd"
fi
