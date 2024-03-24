#!/bin/sh
# set -u

declare -A signal
signal["github"]=4
signal["playerctl"]=5
signal["sunset"]=6
signal["scratchpad"]=7
signal["recorder"]=8
signal["clipboard"]=9
signal["zeit"]=10
signal["dnd"]=11
signal["adaptive"-brightness]=12
signal["valent"]=13
signal["pacman"]=14
signal["idle"]=15

number=${signal[${1}]}

if [ -z "$number" ]; then
  echo "No signal mapped for $1"
  exit 1
fi

pkill -x "-SIGRTMIN+${number}" "${BAR}"
