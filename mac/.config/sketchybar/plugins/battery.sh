#!/usr/bin/env bash

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

case ${PERCENTAGE} in
100)
  ICON="󰁹"
  ;;
[9][0-9])
  ICON="󰂂"
  ;;
[8][0-9])
  ICON="󰂁"
  ;;
[7][0-9])
  ICON="󰂀"
  ;;
[6][0-9])
  ICON="󰁿"
  ;;
[5][0-9])
  ICON="󰁾"
  ;;
[4][0-9])
  ICON="󰁽"
  ;;
[3][0-9])
  ICON="󰁼"
  ;;
[2][0-9])
  ICON="󰁻"
  ;;
[1][0-9])
  ICON="󰁺"
  ;;
*)
  ICON="󰂎"
  ;;
esac

case ${PERCENTAGE} in
[8-9][0-9] | 100)
  HIGHLIGHT="0xff98971a"
  ;;
[3-7][0-9])
  HIGHLIGHT="0xfffabd2f"
  ;;
*)
  HIGHLIGHT="0xffcc241d"
  ICON="󱈸${ICON}"
  ;;
esac

if [[ $CHARGING != "" ]]; then
  ICON="${ICON}󱐋"
fi

sketchybar --set "$NAME" icon="$ICON" \
  icon.color="$HIGHLIGHT" \
  label="${PERCENTAGE}%"
