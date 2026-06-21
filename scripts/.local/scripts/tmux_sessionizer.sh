#!/usr/bin/env sh

set -eu

# based on:
#	- https://github.com/ThePrimeagen/.dotfiles/blob/602019e902634188ab06ea31251c01c1a43d1621/bin/.local/scripts/tmux-sessionizer

repos_path="${HOME}/dev"

search_fd() {
	fd \
		--hidden \
		--min-depth 3 \
		--max-depth 5 \
		--prune \
		--type directory \
		--base-directory "$repos_path" \
		--glob ".git"
}

search_find() {
	find "$repos_path" \
		-mindepth 3 \
		-maxdepth 4 \
		-name .git \
		-prune
}

search() {
	if [ -x "$(command -v fd)" ]; then
		search_fd
	else
		search_find
	fi
}

if [ $# -eq 1 ]; then
	selected=$1
else
	selected=$(
		search |
			sed -e "s|\/.git$||" |
			sed -e "s|^$repos_path\/||" |
			fzf
	)
	if [ -z "$selected" ]; then
		exit 1
	fi
fi

repo_full_path="${repos_path}/${selected}"
repo_org_full_path=$(dirname "$repo_full_path")
repo_name=$(basename "$selected")
org_name=$(basename "$repo_org_full_path")
session_name="${org_name}/${repo_name}"

# ensure session exists
is_tmux_running=$(pgrep tmux)
if [ -z "$is_tmux_running" ] || ! tmux has-session -t="$session_name" 2>/dev/null; then
	tmux new-session -d -s "$session_name" -c "$repo_full_path"
fi

if [ -n "$TMUX" ]; then # if inside tmux
	tmux switch-client -t "$session_name"
else # if not inside tmux
	tmux attach-session -t "$session_name"
fi
