#!/bin/sh

# https://ubuntuforums.org/showthread.php?t=380002
#
# USB Insert / Remove sound script
# Created by om3ganet (msn@om3ga.net)

sound () {
  file=$(
  case ${1} in
    ("insert")
      echo "device-added.oga" ;;
    ("remove")
      echo "device-removed.oga" ;;
    (*)
      return ;;
  esac)

  pw-play "/usr/share/sounds/freedesktop/stereo/${file}"
}

# check frequency (default 0.25 seconds)
CHECKFREQ=0.25

DEVCOUNT=$(lsusb | wc -l | awk '{ print $1 }')
OLDDEVCOUNT=$DEVCOUNT;

while(true) do
  DEVCOUNT=$(lsusb | wc -l | awk '{ print $1 }')
  if [ "${DEVCOUNT}" -gt "${OLDDEVCOUNT}" ]; then
    sound "insert"
  elif [ "${DEVCOUNT}" -lt "${OLDDEVCOUNT}" ]; then
    sound "remove"
  fi

  OLDDEVCOUNT=$DEVCOUNT;

  sleep $CHECKFREQ;
done
