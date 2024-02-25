#!/bin/sh

curr_workspace=$(swaymsg -p -t get_workspaces \
  | grep focused \
  | awk '{print $2}')

# https://stackoverflow.com/a/3803412
dest_workspace=$(
  case ${1} in
    ("prev")
      echo $((((curr_workspace + 8) % 10) + 1)) ;;
    ("next")
      echo $(((curr_workspace % 10) + 1)) ;;
    (*)
      exit 0 ;;
  esac)

~/.config/sway/goto-workspace.sh "${dest_workspace}"
