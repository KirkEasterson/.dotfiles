#!/bin/bash

target="$1"
if tmux list-windows | grep -q "^${target}:"; then
	tmux join-pane -t ":${target}"
else
	tmux break-pane -t ":${target}"
fi

# re-order the windows
tmux move-window -r
