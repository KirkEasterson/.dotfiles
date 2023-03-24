#!/bin/sh

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ $PERCENTAGE = "" ]; then
  exit 0
fi

if [[ $CHARGING = "" ]]; then
  case ${PERCENTAGE} in
    100) ICON="󰁹"
    ;;
    [9][0-9]) ICON="󰂂"
    ;;
    [8][0-9]) ICON="󰂁"
    ;;
    [7][0-9]) ICON="󰂀"
    ;;
    [6][0-9]) ICON="󰁿"
    ;;
    [5][0-9]) ICON="󰁾"
    ;;
    [4][0-9]) ICON="󰁽"
    ;;
    [3][0-9]) ICON="󰁼"
    ;;
    [2][0-9]) ICON="󰁻"
    ;;
    [1][0-9]) ICON="󰁺"
    ;;
    *) ICON="󱃍"
  esac
fi

if [[ $CHARGING != "" ]]; then
  case ${PERCENTAGE} in
    100) ICON="󰂅"
    ;;
    [9][0-9]) ICON="󰂋"
    ;;
    [8][0-9]) ICON="󰂊"
    ;;
    [7][0-9]) ICON="󰢞"
    ;;
    [6][0-9]) ICON="󰂉"
    ;;
    [5][0-9]) ICON="󰢝"
    ;;
    [4][0-9]) ICON="󰂈"
    ;;
    [3][0-9]) ICON="󰂇"
    ;;
    [2][0-9]) ICON="󰂆"
    ;;
    [1][0-9]) ICON="󰢜"
    ;;
    *) ICON="󰢟"
  esac
fi

case ${PERCENTAGE} in
  [8-9][0-9]|100) HIGHLIGHT="0xffb8bb26"
  ;;
  [3-7][0-9]|100) HIGHLIGHT="0xfffabd2f"
  ;;
  *) HIGHLIGHT="0xffcc241d"
esac

sketchybar --set $NAME icon="$ICON" \
                       icon.color="$HIGHLIGHT" \
                       label="${PERCENTAGE}%"
