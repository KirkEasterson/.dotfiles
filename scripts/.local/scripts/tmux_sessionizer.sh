#!/usr/bin/sh

# based on:
#	- https://github.com/ThePrimeagen/.dotfiles/blob/602019e902634188ab06ea31251c01c1a43d1621/bin/.local/scripts/tmux-sessionizer

if [ $# -eq 1 ]; then
	selected=$1
else
	selected=$(
		find ~/dev \
			-mindepth 1 \
			-maxdepth 4 \
			-type d \
			-not -path "*node*modules*" \
			-not -path "*.turbo" \
			-not -path "*.git*" |
			fzf
	)
	if [ -z "$selected" ]; then
		exit 0
	fi
fi

selected_name=$(basename "$selected" | tr . _)

# if inside tmux
if [ -n "$TMUX" ]; then
	# if the session doesn't exist, create it
	if ! tmux has-session -t="$selected_name" 2>/dev/null; then
		tmux new-session -d -s "$selected_name" -c "$selected"
	fi

	tmux switch-client -t "$selected_name"

# if not inside tmux
else
	tmux_running=$(pgrep tmux)

	# if tmux isn't running or the session doesn't exist, create it
	if [ -z "$tmux_running" ] || ! tmux has-session -t="$selected_name" 2>/dev/null; then
		tmux new-session -d -s "$selected_name" -c "$selected"
	fi

	tmux attach-session -t "$selected_name"
fi
