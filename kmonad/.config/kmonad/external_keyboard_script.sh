#!/bin/bash

laptop="/dev/input/by-path/platform-i8042-serio-0-event-kbd"
dactyl="/dev/input/by-id/usb-izwan_zwactyl_50_vial:f64c2b3c-event-kbd"

# This isn't an ideal solution. But the external keyboard gets high priority
# than the laptop keyboard, so check for that first.
if [ -e "${dactyl}" ]; then
	echo "dactyl"
	KBD_DEV=$dactyl
elif [ -e "${laptop}" ]; then
	echo "laptop"
	KBD_DEV=$laptop
else
	echo "exiting"
	exit 0
fi

export KBD_DEV
KBDCFG=$(envsubst <"${HOME}/.config/kmonad/config.kbd")

# TODO: make this line POSIX compliant
kmonad <(echo "$KBDCFG")
