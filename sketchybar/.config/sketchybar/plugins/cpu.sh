#!/usr/bin/env bash

sketchybar -m --set "$NAME" label="$(top -l  2 | grep -E "^CPU" | tail -1 | awk '{ printf("%02.0f\n", $5"%") }')%"
