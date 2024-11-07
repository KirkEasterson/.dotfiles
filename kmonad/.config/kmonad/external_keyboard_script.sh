#!/bin/sh

laptop="by-path/platform-i8042-serio-0-event-kbd"
dactyl="by-id/usb-izwan_zwactyl_50_vial:f64c2b3c-event-kbd"

# This isn't an ideal solution. But the external keyboard gets high priority
# than the laptop keyboard, so check for that first.
if [ -e "/dev/input/${dactyl}" ]; then
	kmonad "${HOME}/.config/kmonad/dactyl.kbd"
elif [ -e "/dev/input/${laptop}" ]; then
	kmonad "${HOME}/.config/kmonad/laptop.kbd"
fi
