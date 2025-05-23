#!/bin/bash

royal_kludge="/dev/input/by-id/usb-MosArt_USB_Keyboard-event-kbd"
laptop="/dev/input/by-path/platform-i8042-serio-0-event-kbd"

regular_config="${HOME}/.config/kmonad/config.kbd"
miryoku_config="${HOME}/.config/kmonad/miryoku.kbd"

# This isn't an ideal solution. But external keyboards gets higher priority
# than the laptop keyboard, so check for that first.
if [ -e "${royal_kludge}" ]; then
	KBD_DEV=$royal_kludge
	KBD_TEMPLATE=$regular_config

elif [ -e "${laptop}" ]; then
	KBD_DEV=$laptop
	KBD_TEMPLATE=$regular_config

else
	echo "exiting"
	exit 0
fi

export KBD_DEV
# NOTE: $XDG_CONFIG_HOME can't be used below
KBDCFG=$(envsubst <"$KBD_TEMPLATE")

# TODO: make this line POSIX compliant
kmonad <(echo "$KBDCFG")
