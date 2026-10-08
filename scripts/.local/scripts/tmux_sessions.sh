#!/usr/bin/env bash

set -eo pipefail

if [ $# -eq 1 ]; then
  session_name=$1
else
  sessions=$(tmux list-sessions -F '#{session_name}')
  if [ -n "$TMUX" ]; then # if inside tmux
    curr_session=$(tmux display-message -p '#S')
    sessions=$(echo "$sessions" | sed "/${curr_session}/d")
  fi

  num_sessions=$(echo "$sessions" | sed '/^\s*$/d' | wc -l)
  if [ "$num_sessions" = "0" ]; then
    exit 0
  fi

  session_name=$(echo "$sessions" | fzf --prompt="SESSION: ")
  if [ -z "$session_name" ]; then
    exit 1
  fi
fi

if [ -n "$TMUX" ]; then # if inside tmux
  tmux switch-client -t "$session_name"
else # if not inside tmux
  tmux attach-session -t "$session_name"
fi
