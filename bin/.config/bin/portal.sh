#!/bin/bash

session="portal"
session_directory="$HOME/dev/unacast-portal/"

# if the session doesn't already exist
tmux has-session -t $session 2>/dev/null
if [ $? != 0 ]; then

	# create the session
	tmux new-session -d -s $session -c $session_directory

	# manage the window running `nvim`
	window=1
	tmux rename-window -t $session:$window 'nvim-portal'
	tmux send-keys -t  $session:$window 'nvim' Enter

	# manage the window with the `make ...` command
	window=2
	tmux new-window -t $session:$window -n 'make' -c $session_directory
	tmux send-keys -t  $session:$window 'make start-locally-for-localhost' Enter
fi

# if currently in tmux, else not in tmux
if [ ! -z "${TMUX}" ]; then
	tmux switch-client -t $session
else
	tmux attach-session -t $session
fi
