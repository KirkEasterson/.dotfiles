#!/usr/bin/env sh

# based on:
#	- https://github.com/ThePrimeagen/.dotfiles/blob/602019e902634188ab06ea31251c01c1a43d1621/bin/.local/scripts/tmux-sessionizer

if [ $# -eq 1 ]; then
	selected=$1
else
	selected=$(
		find ~/dev/github.com/ \
			-mindepth 2 \
			-maxdepth 3 \
			-type d \
			-name .git \
			-prune |
			sed -e "s/\/.git$//" |
			fzf
	)
	if [ -z "$selected" ]; then
		exit 1
	fi
fi

selected_label=$(basename "$selected" | tr . _)

# ensure session exists
is_tmux_running=$(pgrep tmux)
if [ -z "$is_tmux_running" ] || ! tmux has-session -t="$selected_label" 2>/dev/null; then
	tmux new-session -d -s "$selected_label" -c "$selected"
fi

if [ -n "$TMUX" ]; then # if inside tmux
	tmux switch-client -t "$selected_label"
else # if not inside tmux
	tmux attach-session -t "$selected_label"
fi
