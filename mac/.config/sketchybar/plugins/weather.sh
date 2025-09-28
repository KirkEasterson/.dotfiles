#!/usr/bin/env bash

LABEL=$("$HOME"/.local/scripts/weather.sh)
sketchybar --set "$NAME" label="$LABEL"
