#!/bin/sh

# clamshell mode
riverctl map-switch normal lid close spawn "clamshell_or_lock.sh"
riverctl map-switch normal lid open spawn "clamshell_or_lock.sh"
riverctl map-switch locked lid close spawn "clamshell_or_lock.sh"
riverctl map-switch locked lid open spawn "clamshell_or_lock.sh"
riverctl spawn "clamshell.sh"

# TODO: lock on lid close
# riverctl map-switch normal lid close spawn "lock.sh"

# lock after 5 minutes
# turn off display after 10 minutes # TODO: implement this
riverctl spawn "swayidle -w \
	timeout 300 'lock.sh' \
	timeout 600 'set_all_displays.sh off' resume 'set_all_displays.sh on' \
	before-sleep 'lock.sh'"
