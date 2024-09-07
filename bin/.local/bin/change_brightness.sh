#!/bin/bash

raise_brightness () {
  brightnessctl --quiet set 5%+ -n 5
}

lower_brightness () {
  brightnessctl --quiet set 5%- -n 5
}

get_brightness () {
  brightnessctl i | sed -n 's/.*Current brightness: [0-9]* (\([0-9]*\).*/\1/p'
}

get_icon () {
    echo "video-display"
}

notify_user () {
  brightness=$(get_brightness)
  icon=$(get_icon "$brightness")

  notify-send "Brightness" \
    -u "low" \
    -i "$icon" \
    -h "int:value:${brightness}" \
    -h "string:x-canonical-private-synchronous:sys-notify"
}

case "${1}" in
  ("raise")
    raise_brightness
    ;;
  ("lower")
    lower_brightness
    ;;
  (*)
    exit 0
esac

notify_user
