#!/bin/sh

# Set the default layout generator to be rivertile and start it.
# River will send the process group of the init executable SIGTERM on exit.
riverctl default-layout rivertile
rivertile -view-padding 5 -outer-padding 5 -main-ratio 0.5 &
