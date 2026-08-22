#!/bin/sh

riverctl map-switch normal lid open spawn "clamshell.sh"
riverctl map-switch normal lid close spawn "clamshell.sh"
riverctl map-switch locked lid open spawn "clamshell.sh"
riverctl map-switch locked lid close spawn "clamshell.sh"
riverctl spawn "clamshell.sh"
riverctl spawn "swayidle -w"
