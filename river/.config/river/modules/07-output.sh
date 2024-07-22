#!/bin/sh

# detect clamshell on startup
riverctl spawn "clamshell.sh"

# TODO: not this is external display
# lock on lid close
riverctl map-switch normal lid close spawn "lock.sh"

# lock after 5 minutes
riverctl spawn "swayidle -w \
	timeout 300 'lock.sh' \
	before-sleep 'lock.sh'"
