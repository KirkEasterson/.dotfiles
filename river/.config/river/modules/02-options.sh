#!/bin/sh

# events
riverctl map-switch normal lid close spawn "lock.sh"

# Set the default layout generator to be rivertile and start it.
# River will send the process group of the init executable SIGTERM on exit.
riverctl default-layout rivertile
rivertile -view-padding 0 -outer-padding 0 -main-ratio 0.5 &
