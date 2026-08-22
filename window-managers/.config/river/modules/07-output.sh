#!/bin/sh

riverctl map-switch normal lid close spawn "clamshell_or_lock.sh"
riverctl map-switch locked lid close spawn "clamshell_or_lock.sh"
riverctl spawn "swayidle -w"
