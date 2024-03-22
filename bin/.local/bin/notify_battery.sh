#!/bin/bash

sound () {
  file=$(
  case ${1} in
    ("normal")
      echo "battery.oga" ;;
    ("caution")
      echo "battery-caution.oga" ;;
    ("low")
      echo "battery-low.oga" ;;
    (*)
      return ;;
  esac)

  pw-play "/usr/share/sounds/freedesktop/stereo/${file}"
}

# check frequency (default 60 seconds)
CHECKFREQ=60

BATTERY_LEVEL=$(acpi -b | grep -P -o '[0-9]+(?=%)')
OLD_BATTERY_LEVEL=$BATTERY_LEVEL;

while(true) do
  BATTERY_LEVEL=$(acpi -b | grep -P -o '[0-9]+(?=%)')
  if on_ac_power; then
    if [ "${BATTERY_LEVEL}" -ge 95 ]; then
      notify-send "Battery charged" "Charging: ${BATTERY_LEVEL}% "
    fi
  else
    if [ "${BATTERY_LEVEL}" -le 20 ]; then
      notify-send "Critical battery level" "Charging: ${BATTERY_LEVEL}%"
    fi
  fi

  sleep $CHECKFREQ;
done
