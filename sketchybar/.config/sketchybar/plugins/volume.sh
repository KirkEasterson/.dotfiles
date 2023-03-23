#!/bin/sh

# The volume_change event supplies a $INFO variable in which the current volume
# percentage is passed to the script.

VOLUME=$INFO

BT_DEVICES="$(system_profiler SPBluetoothDataType -json -detailLevel basic 2>/dev/null | jq '.SPBluetoothDataType' | jq '.[0]' | jq '.device_title' | jq -r '.[] | keys[] as $k | "\($k) \(.[$k] | .device_isconnected) \(.[$k] | .device_minorClassOfDevice_string)"' | grep 'attrib_Yes' | grep 'Headphones')"

if [ "$BT_DEVICES" != "" ]; then
  ICON=󰋋
else
  ICON=󰋋
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
