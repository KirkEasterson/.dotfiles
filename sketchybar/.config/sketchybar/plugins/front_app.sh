#!/usr/bin/env sh

case $INFO in
  "kitty"|"Alacritty"|"WezTerm")
    ICON=
    ;;
  "Calendar")
    ICON=
    ;;
  "System Settings")
    ICON=
    ;;
  "Neovide")
    ICON=
    ;;
  "Discord")
    ICON=ﭮ
    ;;
  "1Password")
    ICON=󰢁
    ;;
  "FaceTime")
    ICON=
    ;;
  "Finder")
    ICON=
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
    ICON=
    ;;
  "Notion")
    ICON=
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
    ICON=﯂
    ;;
esac

sketchybar --set $NAME icon=$ICON \
                       label="$INFO"
