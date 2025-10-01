#!/usr/bin/env bash

LABEL="$(top -l 2 | grep -E "^CPU" | tail -1 | awk '{ printf("%02.0f\n", $5"%") }')%"
sketchybar -m --set "$NAME" label="$LABEL"
