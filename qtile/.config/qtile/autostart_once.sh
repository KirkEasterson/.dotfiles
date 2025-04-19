#!/bin/bash

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
if [ -n "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ]; then
	"${HOME}/.fehbg" &
else
	systemctl --user import-environment DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
	hash dbus-update-activation-environment 2>/dev/null && dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=qtile &
	swaybg --image "${XDG_CONFIG_HOME}/wallpaper" &
fi
