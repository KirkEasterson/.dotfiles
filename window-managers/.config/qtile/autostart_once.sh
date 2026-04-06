#!/bin/bash

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
wallpaper.sh

if [ -n "$WAYLAND_DISPLAY" ]; then
	systemctl --user import-environment DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
	hash dbus-update-activation-environment 2>/dev/null && dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=qtile &
fi
