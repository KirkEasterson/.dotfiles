#!/bin/sh

riverctl spawn "systemctl --user import-environment DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
riverctl spawn "hash dbus-update-activation-environment 2>/dev/null && dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=river"
riverctl spawn "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
riverctl spawn "${XDG_CONFIG_HOME}/waybar/start.sh"
riverctl spawn "swaybg --image ${XDG_CONFIG_HOME}/wall.png"
