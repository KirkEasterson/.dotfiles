#!/bin/sh

# lock
riverctl map normal Super+Control Q spawn lock.sh

# terminals
riverctl map normal Super Return spawn "$TERMINAL"
riverctl map normal Super+Shift Return spawn "$TERMINAL_SECONDARY"

# file managers
riverctl map normal Super E spawn "$FILEMANAGER"
riverctl map normal Super+Shift E spawn "$TERMINAL -e ranger"

# launchers
riverctl map normal Super Space spawn search.sh
riverctl map normal Super+Control Space spawn emoji_picker.sh

# browsers
riverctl map normal Super W spawn "$BROWSER"
riverctl map normal Super+Shift W spawn "$BROWSER_SECONDARY"

# notes
riverctl map normal Super N spawn "notes.sh edit"
riverctl map normal Super+Shift N spawn "notes.sh view"

# close window
riverctl map normal Super+Shift Q close

# restart river
riverctl map normal Super+Control R spawn "${XDG_CONFIG_HOME}/river/init && notify-send \"Reloaded riverwm\" -i \"system-reboot\""

# exit river
riverctl map normal Super+Shift X exit

# screenshot
riverctl map normal None Print spawn "screenshot.sh gui"
riverctl map normal Super Print "screenshot.sh fullscreen"

# keyboard layouts
riverctl map normal Super+Shift A spawn "set_keymap.sh \"us(altgr-intl)\""
riverctl map normal Super+Shift S spawn "set_keymap.sh se"
riverctl map normal Super+Shift G spawn "set_keymap.sh no"
riverctl map normal Super+Shift D spawn "set_keymap.sh prog-qwerty"

################################
# Window control
################################

# focus the next/previous view in the layout stack
riverctl map normal Super J focus-view next
riverctl map normal Super K focus-view previous

# swap the focused view with the next/previous view in the layout stack
riverctl map normal Super+Shift J swap next
riverctl map normal Super+Shift K swap previous

# focus the next/previous output
riverctl map normal Super Period focus-output next
riverctl map normal Super Comma focus-output previous

# send the focused view to the next/previous output
riverctl map normal Super+Shift Period send-to-output next
riverctl map normal Super+Shift Comma send-to-output previous

# TODO: re/implement this
# bump the focused view to the top of the layout stack
# riverctl map normal Super Return zoom

# decrease/increase the main ratio of rivertile(1)
riverctl map normal Super H send-layout-cmd rivertile "main-ratio -0.05"
riverctl map normal Super L send-layout-cmd rivertile "main-ratio +0.05"

# increment/decrement the main count of rivertile(1)
riverctl map normal Super+Shift H send-layout-cmd rivertile "main-count +1"
riverctl map normal Super+Shift L send-layout-cmd rivertile "main-count -1"

# move views
riverctl map normal Super+Alt H move left 100
riverctl map normal Super+Alt J move down 100
riverctl map normal Super+Alt K move up 100
riverctl map normal Super+Alt L move right 100

# snap views to screen edges
riverctl map normal Super+Alt+Control H snap left
riverctl map normal Super+Alt+Control J snap down
riverctl map normal Super+Alt+Control K snap up
riverctl map normal Super+Alt+Control L snap right

# resize views
riverctl map normal Super+Alt+Shift H resize horizontal -100
riverctl map normal Super+Alt+Shift J resize vertical 100
riverctl map normal Super+Alt+Shift K resize vertical -100
riverctl map normal Super+Alt+Shift L resize horizontal 100

# move views
riverctl map-pointer normal Super BTN_LEFT move-view

# resize views
riverctl map-pointer normal Super BTN_RIGHT resize-view

# toggle float
riverctl map-pointer normal Super BTN_MIDDLE toggle-float

for i in $(seq 1 9)
do
    tags=$((1 << ($i - 1)))

    # move to tag
    riverctl map normal Super $i set-focused-tags $tags

    # move window to tag
    riverctl map normal Super+Shift $i set-view-tags $tags

    # pin tag
    riverctl map normal Super+Control $i toggle-focused-tags $tags

    # pin window to tag
    riverctl map normal Super+Shift+Control $i toggle-view-tags $tags
done

# next/prev tag
riverctl map normal Super Tab set-focused-tags next
riverctl map normal Super+Shift Tab set-focused-tags prev


all_tags=$(((1 << 32) - 1))
# focus all tags
riverctl map normal Super 0 set-focused-tags $all_tags
# tag focused view with all tags
riverctl map normal Super+Shift 0 set-view-tags $all_tags

# toggle float
riverctl map normal Super F toggle-float

# toggle fullscreen
riverctl map normal Super+Shift F toggle-fullscreen

# change layout orientation
riverctl map normal Super Up    send-layout-cmd rivertile "main-location top"
riverctl map normal Super Right send-layout-cmd rivertile "main-location right"
riverctl map normal Super Down  send-layout-cmd rivertile "main-location bottom"
riverctl map normal Super Left  send-layout-cmd rivertile "main-location left"

# Declare a passthrough mode. This mode has only a single mapping to return to
# normal mode. This makes it useful for testing a nested wayland compositor
riverctl declare-mode passthrough

# enter passthrough mode
riverctl map normal Super F11 enter-mode passthrough

# return to normal mode
riverctl map passthrough Super F11 enter-mode normal

# Various media key mapping examples for both normal and locked mode which do
# not have a modifier
for mode in normal locked
do
    # Eject the optical drive (well if you still have one that is)
    riverctl map $mode None XF86MonBrightnessDown spawn "change_brightness.sh lower"
    riverctl map $mode None XF86MonBrightnessUp   spawn "change_brightness.sh raise"

    # Control pulse audio volume with pamixer (https://github.com/cdemoulins/pamixer)
    riverctl map $mode None XF86AudioLowerVolume  spawn "change_vol.sh lower"
    riverctl map $mode None XF86AudioRaiseVolume  spawn "change_vol.sh raise"
    riverctl map $mode None XF86AudioMute         spawn "change_vol.sh toggle-mute"
    riverctl map $mode None XF86AudioMicMute      spawn "change_vol.sh toggle-mic-mute"

    # Control MPRIS aware media players with playerctl (https://github.com/altdesktop/playerctl)
    riverctl map $mode None XF86AudioPlay     spawn "playerctl play-pause"
    riverctl map $mode None XF86AudioPause    spawn "playerctl pause"
    riverctl map $mode None XF86AudioStop     spawn "playerctl stop"
    riverctl map $mode None XF86AudioPrev     spawn "playerctl previous"
    riverctl map $mode None XF86AudioNext     spawn "playerctl next"
    riverctl map $mode None XF86AudioRewind   spawn "playerctl position 5-"
    riverctl map $mode None XF86AudioForward  spawn "playerctl position 5+"
done
