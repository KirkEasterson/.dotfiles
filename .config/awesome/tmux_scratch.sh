#!/bin/bash

# TODO: don't assume tmux is installed

session="scratchpad"
session_directory="~/"

# if the session doesn't already exist
tmux has-session -t $session 2> /dev/null
if [ $? != 0 ]; then

	# create the session
	tmux new-session -d -s $session -c $session_directory

	# manage the 'main' window
	window=1
	tmux rename-window -t $session:$window 'main'

	# manage the calculator
	window=2
	tmux new-window -t $session:$window -n 'calculator' -c $session_directory
	tmux send-keys -t $session:$window 'python3 -q' Enter
fi

