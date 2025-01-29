#!/bin/bash

moergo="/dev/input/by-id/usb-MoErgo_Glove80_Left_moergo.com:GLV80-320B6C0561C725F1-event-kbd"
dactyl="/dev/input/by-id/usb-izwan_zwactyl_50_vial:f64c2b3c-event-kbd"
royal_kludge="/dev/input/by-id/usb-MosArt_USB_Keyboard-event-kbd"
laptop="/dev/input/by-path/platform-i8042-serio-0-event-kbd"
ergodox="/dev/input/by-id/usb-ZSA_Technology_Labs_ErgoDox_EZ_Glow-event-kbd"

# This isn't an ideal solution. But the external keyboard gets high priority
# than the laptop keyboard, so check for that first.
if [ -e "${moergo}" ]; then
	KBD_DEV=$moergo

elif [ -e "${ergodox}" ]; then
	KBD_DEV=$ergodox

elif [ -e "${dactyl}" ]; then
	KBD_DEV=$dactyl

elif [ -e "${royal_kludge}" ]; then
	KBD_DEV=$royal_kludge

elif [ -e "${laptop}" ]; then
	KBD_DEV=$laptop

else
	echo "exiting"
	exit 0
fi

export KBD_DEV
# NOTE: $XDG_CONFIG_HOME can't be used below
KBDCFG=$(envsubst <"${HOME}/.config/kmonad/config.kbd")

# TODO: make this line POSIX compliant
kmonad <(echo "$KBDCFG")
