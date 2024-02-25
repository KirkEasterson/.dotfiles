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
      echo "${1}" ;;
  esac)

other_display=$(swaymsg -p -t get_workspaces \
  | sed -n "/^Workspace ${dest_workspace}$/{n; p;}" \
  | awk '{print $2}')

if [ "$other_display" ]; then
  # move curr workspace to other display
  swaymsg "[workspace=\"${curr_workspace}\"]" move workspace to output "${other_display}"
fi

# move dest workspace to current display
swaymsg "[workspace=\"${dest_workspace}\"]" move workspace to output current
swaymsg workspace "${dest_workspace}"
