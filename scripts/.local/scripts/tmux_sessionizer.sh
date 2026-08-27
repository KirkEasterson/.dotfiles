#!/usr/bin/env bash

set -eo pipefail

# based on:
#	- https://github.com/ThePrimeagen/.dotfiles/blob/602019e902634188ab06ea31251c01c1a43d1621/bin/.local/scripts/tmux-sessionizer

repos_path="${HOME}/dev/"

search_fd() {
	fd \
		--hidden \
		--min-depth 3 \
		--max-depth 4 \
		--prune \
		--base-directory "$repos_path" \
		--glob ".git"
}

search_find() {
	find "$repos_path" \
		-mindepth 3 \
		-maxdepth 4 \
		-name .git \
		-prune 2>/dev/null
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
			fzf --prompt="REPO: "
	)
	if [ -z "$selected" ]; then
		exit 1
	fi
fi

repo_path="${repos_path}${selected}"
# NOTE: tmux implicitly replaces `.` with `_` when creating sessions, but not
# when attaching to sessions. the substitution must be done for both cases,
# otherwise a session made from `.` cannot be connected to when using `_`.
repo_name=$(basename "$selected" | sed 's/\./_/g')
session_name=$repo_name
session_path=$repo_path

is_bare_repo=$(git -C ${repo_path} rev-parse --is-bare-repository)
if [ "$is_bare_repo" == "true" ]; then
	branch=$(
		git -C ${repo_path} branch --format='%(refname:short)' |
			fzf --prompt="WORKTREE: "
	)

	session_name="$repo_name - $branch"
	session_path="${repo_path}/.worktrees/${branch}"

	# create worktree if not exists
	if ! git -C ${repo_path} worktree list | grep -q "\[${branch}\]"; then
		# TODO: copy ignored files
		git -C ${repo_path} worktree add "${session_path}" "$branch"
	fi
fi

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
