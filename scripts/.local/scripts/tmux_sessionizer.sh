#!/usr/bin/sh

# based on:
#	- https://github.com/ThePrimeagen/.dotfiles/blob/602019e902634188ab06ea31251c01c1a43d1621/bin/.local/scripts/tmux-sessionizer

if [ $# -eq 1 ]; then
	selected=$1
else
	selected=$(find ~/dev -mindepth 1 -maxdepth 2 -type d | fzf)
fi

if [ -z "$selected" ]; then
	exit 0
fi

selected_name=$(basename "$selected" | tr . _)

if [ -n "$TMUX" ]; then
	tmux switch-client -t "$selected_name"
fi

tmux_running=$(pgrep tmux)

if [ -z "$tmux_running" ] || ! tmux has-session -t="$selected_name" 2>/dev/null; then
	tmux new-session -d -s "$selected_name" -c "$selected"
fi

# TODO: make this work
tmux attach-session -t "$selected_name"
