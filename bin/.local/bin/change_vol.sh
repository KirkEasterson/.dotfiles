#!/bin/bash

# NOTE: this script requires the executable `bc`

vol_diff="10"

raise_vol () {
  wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ ${vol_diff}%+
}

lower_vol () {
  wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ ${vol_diff}%-
}

toggle_mute () {
  wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
}

toggle_mic_mute () {
  wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
}

get_volume () {
  # TODO: optimize this. it shouldn't be hard to convert a decimal to a percent
  vol_float=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')
  vol_percent=$(echo "$vol_float*100" | bc)
  vol_int=${vol_percent%.*}
  echo "${vol_int}"
}

is_muted () {
  return "$(wpctl get-volume @DEFAULT_AUDIO_SINK@ |  grep -v -c "MUTED")"
}

get_icon () {
  if is_muted; then
    echo "audio-volume-muted"
    exit
  fi

  case $(printf "%02d" "$1") in
    [0-2][0-9]) echo "audio-volume-low" ;;
    [3-7][0-9]) echo "audio-volume-medium" ;;
    *) echo "audio-volume-high" ;;
  esac
}

notify_user () {
  # if ($1 ==  "mic") {
  #   something else
  # }

  volume=$(get_volume)
  icon=$(get_icon "$volume")

  notify-send "Volume" \
    -u "low" \
    -i "$icon" \
    -h "int:value:${volume}" \
    -h "string:x-canonical-private-synchronous:sys-notify"
}

case "${1}" in
  ("raise")
    raise_vol
    ;;
  ("lower")
    lower_vol
    ;;
  ("toggle-mute")
    toggle_mute
    ;;
  ("toggle-mic-mute")
    toggle_mic_mute
    ;;
  (*)
    exit 0
esac

notify_user
