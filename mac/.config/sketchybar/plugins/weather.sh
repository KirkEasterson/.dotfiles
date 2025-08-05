#!/usr/bin/env sh

IP=$(curl -s https://ipinfo.io/ip)
LOCATION_JSON=$(curl -s https://ipinfo.io/$IP/json)

LOCATION="$(echo $LOCATION_JSON | jq '.city' | tr -d '"')"
REGION="$(echo $LOCATION_JSON | jq '.region' | tr -d '"')"
COUNTRY="$(echo $LOCATION_JSON | jq '.country' | tr -d '"')"

# Line below replaces spaces with +
LOCATION_ESCAPED="${LOCATION// /+}+${REGION// /+}"
WEATHER_JSON=$(curl -s "https://wttr.in/$LOCATION_ESCAPED?format=%c+%t+%m")

# Fallback if empty
if [ -z $WEATHER_JSON ]; then
  sketchybar --set $NAME label.drawin=off icon.drawing=off
  # sketchybar --set $NAME.moon icon.drawing=off
  return
fi

read -a parts <<< $WEATHER_JSON
WEATHER_ICON="${parts[0]}"
TEMPERATURE="${parts[1]}"
MOON_PHASE="${parts[2]}"

sketchybar --set $NAME label="$LOCATION $TEMPERATURE" \
                       icon=$WEATHER_ICON
# sketchybar --set $NAME.moon icon=$ICON
