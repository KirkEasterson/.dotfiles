#!/bin/sh

################################
# All inputs
################################

riverctl set-repeat 30 200
riverctl keyboard-layout -options "caps:escape" "no"

riverctl input pointer-* accel-profile flat
riverctl input pointer-* click-method clickfinger
riverctl input pointer-* drag disabled
riverctl input pointer-* middle-emulation enabled
riverctl input pointer-* natural-scroll enabled
riverctl input pointer-* tap enabled
riverctl input pointer-* scroll-method two-finger

################################
# Specific inputs
################################

riverctl input "*-Kensington_Orbit_Fusion_Wireless_Trackball" scroll-button BTN_MIDDLE
riverctl input "*-Kensington_Orbit_Fusion_Wireless_Trackball" scroll-method button
riverctl input "*-Kensington_Orbit_Fusion_Wireless_Trackball" scroll-factor 0.4

riverctl input "*-Getech_HUGE_TrackBall" scroll-button BTN_TASK
riverctl input "*-Getech_HUGE_TrackBall" scroll-method button
riverctl input "*-Getech_HUGE_TrackBall" scroll-factor 0.4
