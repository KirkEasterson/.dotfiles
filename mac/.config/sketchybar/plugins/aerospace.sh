#!/usr/bin/env bash

FOCUSED_WORKSPACE=$(<~/.local/share/aerospace/focused_workspace)
EMPTY_WORKSPACES=$(<~/.local/share/aerospace/empty_workspaces)

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set "$NAME" background.drawing=on drawing=on
elif [[ $EMPTY_WORKSPACES != *"$1"* ]]; then
  sketchybar --set "$NAME" background.drawing=off drawing=on
else
  sketchybar --set "$NAME" drawing=off
fi
