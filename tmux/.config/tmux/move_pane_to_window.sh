#!/bin/bash

target="$1"
if tmux list-windows | grep -q "^${target}:"; then
	tmux join-pane -d -t ":${target}"
else
	tmux break-pane -d -t ":${target}"
fi

# re-order the windows
tmux move-window -r
