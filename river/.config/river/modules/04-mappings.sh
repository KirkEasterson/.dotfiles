#!/bin/sh

################################
# River control
################################

# lock
riverctl map normal Super+Control Q spawn lock.sh

# restart river
riverctl map normal Super+Control R spawn "${XDG_CONFIG_HOME}/river/init && notify-send \"Reloaded riverwm\" -i \"system-reboot\""

# exit river
riverctl map normal Super+Shift X exit

################################
# Programs
################################

# terminals
riverctl map normal Super Return spawn "$TERMINAL"
riverctl map normal Super+Shift Return spawn "$TERMINAL_SECONDARY"

# file managers
riverctl map normal Super E spawn "$TERMINAL -e yazi"
riverctl map normal Super+Shift E spawn "$FILEMANAGER"

# launchers
riverctl map normal Super Space spawn search.sh
riverctl map normal Super+Control Space spawn emoji_picker.sh

# browsers
riverctl map normal Super W spawn "$BROWSER"
riverctl map normal Super+Shift W spawn "$BROWSER_SECONDARY"

# notes
riverctl map normal Super N spawn "notes.sh edit"
riverctl map normal Super+Shift N spawn "notes.sh view"

# screenshot
riverctl map normal None Print spawn "screenshot.sh gui"
riverctl map normal Super Print "screenshot.sh window"
riverctl map normal Super+Shift Print "screenshot.sh fullscreen"

# keyboard layouts
riverctl map normal Super+Shift A spawn "set_keymap.sh \"us(altgr-intl)\""
riverctl map normal Super+Shift S spawn "set_keymap.sh se"
riverctl map normal Super+Shift G spawn "set_keymap.sh no"
riverctl map normal Super+Shift D spawn "set_keymap.sh prog-qwerty"

riverctl map normal Super+Shift T spawn "webcam.sh"

################################
# Window control
################################

# close window
riverctl map normal Super+Shift Q close
#
# bump the focused view to the top of the layout stack
riverctl map normal Super Z zoom

# focus the next/previous view in the layout stack
riverctl map normal Super J focus-view next
riverctl map normal Super K focus-view previous
riverctl map normal Super Down focus-view next
riverctl map normal Super Up focus-view previous

# swap the focused view with the next/previous view in the layout stack
riverctl map normal Super+Shift J swap next
riverctl map normal Super+Shift K swap previous
riverctl map normal Super+Shift Down swap next
riverctl map normal Super+Shift Up swap previous

# focus the next/previous output
riverctl map normal Super+Control J focus-output next
riverctl map normal Super+Control K focus-output previous
riverctl map normal Super+Control Down focus-output next
riverctl map normal Super+Control Up focus-output previous

# send the focused view to the next/previous output
riverctl map normal Super+Control+Shift J send-to-output -current-tags next
riverctl map normal Super+Control+Shift K send-to-output -current-tags previous
riverctl map normal Super+Control+Shift Down send-to-output -current-tags next
riverctl map normal Super+Control+Shift Up send-to-output -current-tags previous

# decrease/increase the main ratio of rivertile(1)
riverctl map normal Super H send-layout-cmd rivertile "main-ratio -0.05"
riverctl map normal Super L send-layout-cmd rivertile "main-ratio +0.05"
riverctl map normal Super Left send-layout-cmd rivertile "main-ratio -0.05"
riverctl map normal Super Right send-layout-cmd rivertile "main-ratio +0.05"

# increment/decrement the main count of rivertile(1)
riverctl map normal Super+Shift H send-layout-cmd rivertile "main-count -1"
riverctl map normal Super+Shift L send-layout-cmd rivertile "main-count +1"
riverctl map normal Super+Shift Left send-layout-cmd rivertile "main-count -1"
riverctl map normal Super+Shift Up send-layout-cmd rivertile "main-count +1"

# move floating views (will convert view from tiled to floating)
riverctl map normal Super+Alt H move left 100
riverctl map normal Super+Alt J move down 100
riverctl map normal Super+Alt K move up 100
riverctl map normal Super+Alt L move right 100
riverctl map normal Super+Alt Left move left 100
riverctl map normal Super+Alt Down move down 100
riverctl map normal Super+Alt Up move up 100
riverctl map normal Super+Alt Right move right 100

# snap floating views to screen edges (will convert view from tiled to floating)
riverctl map normal Super+Alt+Control H snap left
riverctl map normal Super+Alt+Control J snap down
riverctl map normal Super+Alt+Control K snap up
riverctl map normal Super+Alt+Control L snap right
riverctl map normal Super+Alt+Control Left snap left
riverctl map normal Super+Alt+Control Down snap down
riverctl map normal Super+Alt+Control Up snap up
riverctl map normal Super+Alt+Control Right snap right

# resize floating views (will convert view from tiled to floating)
riverctl map normal Super+Alt+Shift H resize horizontal -100
riverctl map normal Super+Alt+Shift J resize vertical 100
riverctl map normal Super+Alt+Shift K resize vertical -100
riverctl map normal Super+Alt+Shift L resize horizontal 100
riverctl map normal Super+Alt+Shift Left resize horizontal -100
riverctl map normal Super+Alt+Shift Down resize vertical 100
riverctl map normal Super+Alt+Shift Up resize vertical -100
riverctl map normal Super+Alt+Shift Right resize horizontal 100

# manipulate floating views
riverctl map-pointer normal Super BTN_LEFT move-view
riverctl map-pointer normal Super BTN_MIDDLE toggle-float
riverctl map-pointer normal Super BTN_RIGHT resize-view

for i in $(seq 1 9); do
	tags=$((1 << (i - 1)))

	# move to tag
	riverctl map normal Super "$i" set-focused-tags "$tags"

	# move window to tag
	riverctl map normal Super+Shift "$i" set-view-tags "$tags"

	# pin tag
	riverctl map normal Super+Control "$i" toggle-focused-tags "$tags"

	# pin window to tag
	riverctl map normal Super+Shift+Control "$i" toggle-view-tags "$tags"
done

# next/prev tag
riverctl map normal Super Tab set-focused-tags next
riverctl map normal Super+Shift Tab set-focused-tags prev

# toggle float
riverctl map normal Super F toggle-float

# toggle fullscreen
riverctl map normal Super+Shift F toggle-fullscreen

# Various media key mapping examples for both normal and locked mode which do
# not have a modifier
for mode in normal locked; do
	# Eject the optical drive (well if you still have one that is)
	riverctl map -repeat $mode None XF86MonBrightnessDown spawn "change_brightness.sh lower"
	riverctl map -repeat $mode None XF86MonBrightnessUp spawn "change_brightness.sh raise"

	# Control pulse audio volume with pamixer (https://github.com/cdemoulins/pamixer)
	riverctl map -repeat $mode None XF86AudioLowerVolume spawn "change_vol.sh lower"
	riverctl map -repeat $mode None XF86AudioRaiseVolume spawn "change_vol.sh raise"
	riverctl map $mode None XF86AudioMute spawn "change_vol.sh toggle-mute"
	riverctl map $mode None XF86AudioMicMute spawn "change_vol.sh toggle-mic-mute"

	# Control MPRIS aware media players with playerctl (https://github.com/altdesktop/playerctl)
	riverctl map $mode None XF86AudioPlay spawn "playerctl play-pause"
	riverctl map $mode None XF86AudioPause spawn "playerctl pause"
	riverctl map $mode None XF86AudioStop spawn "playerctl stop"
	riverctl map $mode None XF86AudioPrev spawn "playerctl previous"
	riverctl map $mode None XF86AudioNext spawn "playerctl next"
	riverctl map -repeat $mode None XF86AudioRewind spawn "playerctl position 5-"
	riverctl map -repeat $mode None XF86AudioForward spawn "playerctl position 5+"
done
