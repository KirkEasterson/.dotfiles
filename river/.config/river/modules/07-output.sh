#!/bin/sh

# clamshell mode
riverctl map-switch normal lid close spawn "clamshell_or_lock.sh"
riverctl map-switch normal lid open spawn "clamshell_or_lock.sh"
riverctl map-switch locked lid close spawn "clamshell_or_lock.sh"
riverctl map-switch locked lid open spawn "clamshell_or_lock.sh"
riverctl spawn "clamshell.sh"
riverctl spawn "swayidle -w"
