#!/bin/sh

dest_workspace=${1}

other_display=$(swaymsg -p -t get_workspaces \
  | sed -n "/^Workspace ${dest_workspace}$/{n; p;}" \
  | awk '{print $2}')

curr_display=$(swaymsg -p -t get_workspaces \
  | sed -n '/Workspace [0-9]* (focused)/{n; p;}' \
  | awk '{print $2}')

if [ ! "$other_display" ]; then
  swaymsg "[workspace=\"${dest_workspace}\"]" move workspace to output ${curr_display}
  swaymsg workspace ${dest_workspace}
  exit 0
fi

curr_workspace=$(swaymsg -p -t get_workspaces \
  | grep focused \
  | awk '{print $2}')

# move curr workspace to other display
swaymsg "[workspace=\"${curr_workspace}\"]" move workspace to output ${other_display}

# move dest workspace to current display
swaymsg "[workspace=\"${dest_workspace}\"]" move workspace to output ${curr_display}
swaymsg workspace ${dest_workspace}
