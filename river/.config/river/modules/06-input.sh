#!/bin/sh

riverctl set-repeat 30 200
riverctl keyboard-layout -options "caps:escape" "no"

riverctl input pointer-* accel-profile flat
riverctl input pointer-* click-method clickfinger
riverctl input pointer-* drag disabled
riverctl input pointer-* middle-emulation enabled
riverctl input pointer-* natural-scroll enabled
riverctl input pointer-* tap enabled
riverctl input pointer-* scroll-method two-finger
