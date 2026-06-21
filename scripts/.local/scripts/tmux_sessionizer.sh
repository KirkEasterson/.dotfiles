#!/usr/bin/env sh

set -e

# based on:
#	- https://github.com/ThePrimeagen/.dotfiles/blob/602019e902634188ab06ea31251c01c1a43d1621/bin/.local/scripts/tmux-sessionizer

repos_path="${HOME}/dev/"

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
			sed -e "s|^$repos_path||" -e "s|\/.git[\/]\{0,1\}$||" |
			fzf
	)
	if [ -z "$selected" ]; then
		exit 1
	fi
fi

session_path="${repos_path}${selected}"
session_name=$(basename "$selected")

# NOTE: tmux implicitly replaces `.` with `_` when creating sessions. attaching
# to the session will break without this. BUT, this must also be done while
# creating the session. otherwise a session made from `.` cannot be connected
# to when using `_`
session_name=$(echo "${session_name}" | sed 's/\./_/g')

# ensure session exists
is_tmux_running=$(pgrep tmux)
if [ -z "$is_tmux_running" ] || ! tmux has-session -t="$session_name" 2>/dev/null; then
	tmux new-session -d -s "$session_name" -c "$session_path"
fi

if [ -n "$TMUX" ]; then # if inside tmux
	tmux switch-client -t "$session_name"
else # if not inside tmux
	tmux attach-session -t "$session_name"
fi
