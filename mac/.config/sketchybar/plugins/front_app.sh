#!/usr/bin/env bash

case $INFO in
"kitty" | "Alacritty" | "WezTerm")
  ICON=
  ;;
"Calendar")
  ICON=
  ;;
"System Information")
  ICON=
  ;;
"System Settings")
  ICON=
  ;;
"App Store")
  ICON=󰒚
  ;;
"Neovide")
  ICON=
  ;;
"Discord")
  ICON=󰙯
  ;;
"1Password")
  ICON=󰢁
  ;;
"FaceTime")
  ICON=
  ;;
"Finder")
  ICON=󰀶
  ;;
"Firefox")
  ICON=󰈹
  ;;
"Google Chrome")
  ICON=
  ;;
"Slack")
  ICON=󰒱
  ;;
"Messages")
  ICON=󰍡
  ;;
"Notion")
  ICON=󰂺
  ;;
"PS Remote Play")
  ICON=
  ;;
"Spotify")
  ICON=
  ;;
"DBeaver")
  ICON=
  ;;
"Code")
  ICON=󰨞
  ;;
*)
  ICON=󰛄
  ;;
esac

sketchybar --set "$NAME" icon=$ICON \
  label="$INFO"
