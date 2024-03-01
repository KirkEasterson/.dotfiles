#!/bin/sh

# https://ubuntuforums.org/showthread.php?t=380002

# USB Insert / Remove sound script
# Created by om3ganet (msn@om3ga.net)
# --------------------------------------------------
# This script could probably be cleaned up, and add checking
# of unrecognised usb sounds (and play fail noise)

insert_sound () {
    pw-play /usr/share/sounds/freedesktop/stereo/device-added.oga
}

remove_sound () {
    pw-play /usr/share/sounds/freedesktop/stereo/device-removed.oga
}

# check frequency (default 0.25 seconds)
CHECKFREQ=0.25


# Do not edit below this line
# --------------------------------------------------
DEVCOUNT=$(lsusb | wc -l | awk '{ print $1 }')
OLDDEVCOUNT=$DEVCOUNT;

while(true) do
  sleep $CHECKFREQ;
  DEVCOUNT=$(lsusb | wc -l | awk '{ print $1 }')
  if [ $DEVCOUNT -gt $OLDDEVCOUNT ]; then
    insert_sound
  else if [ $DEVCOUNT -lt $OLDDEVCOUNT ]; then
    remove_sound
  fi fi
  OLDDEVCOUNT=$DEVCOUNT;
done
