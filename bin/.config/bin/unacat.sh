#!/bin/bash

session="unacat"
session_directory="$HOME/dev/unacat/"

# if the session doesn't already exist
tmux has-session -t $session 2>/dev/null
if [ $? != 0 ]; then

	# create the session
	tmux new-session -d -s $session -c $session_directory

	# manage the window running `nvim`
	window=1
	tmux rename-window -t $session:$window 'nvim'
	tmux send-keys -t  $session:$window 'nvim' Enter

	# manage the window with the `make ...` command
	window=2
	tmux new-window -t $session:$window -n 'dataops' -c $session_directory
	tmux send-keys -t  $session:$window 'sleep 2' Enter # `docker ...` has to be run before `make ...`
	tmux send-keys -t  $session:$window 'make local-run-unacat-dataops' Enter

	# manage the window with the `make ...` command
	window=3
	tmux new-window -t $session:$window -n 'unacat-http' -c $session_directory
	tmux send-keys -t  $session:$window 'sleep 1' Enter # `docker ...` has to be run before `make ...`
	tmux send-keys -t  $session:$window 'make local-run-unacat' Enter

	# manage the window with the `make ...` command
	window=4
	tmux new-window -t $session:$window -n 'unacat-grpc' -c $session_directory
	tmux send-keys -t  $session:$window 'sleep 1' Enter # `docker ...` has to be run before `make ...`
	tmux send-keys -t  $session:$window 'make local-run-unacat-grpc' Enter

	# manage the window with the `docker ...` command
	window=5
	tmux new-window -t $session:$window -n 'docker' -c $session_directory
	tmux send-keys -t  $session:$window 'colima start' Enter
	tmux send-keys -t  $session:$window 'docker-compose up' Enter
fi

# if currently in tmux, else not in tmux
if [ ! -z "${TMUX}" ]; then
	tmux switch-client -t $session
else
	tmux attach-session -t $session
fi
