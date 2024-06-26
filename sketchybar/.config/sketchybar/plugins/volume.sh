#!/bin/sh

# The volume_change event supplies a $INFO variable in which the current volume
# percentage is passed to the script.

VOLUME=$INFO

BT_DEVICES=$(system_profiler SPBluetoothDataType -json -detailLevel basic 2>/dev/null | jq '.SPBluetoothDataType[0].device_connected[]? | select( .[] | .device_minorType == "Headphones") | keys[]')

if [ "$BT_DEVICES" != "" ]; then
  ICON=󰋋
else
  case ${VOLUME} in
    [7-9][0-9]|100) ICON="󰕾"
    ;;
    [4-6][0-9]) ICON="󰖀"
    ;;
    [1-3][0-9]|[1-9]) ICON="󰕿"
    ;;
    *) ICON="󰸈"
  esac
fi

sketchybar --set $NAME icon="$ICON" label="$VOLUME%"
