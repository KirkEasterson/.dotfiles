#!/bin/sh
# set -u

bar_pid=$(pidof -x "$BAR")

if [ "$bar_pid" = "" ]; then
    exit 0
fi

declare -A signal
signal["qtile-groups"]=7
signal["recorder"]=8
signal["idle"]=15

number=${signal[${1}]}

if [ -z "$number" ]; then
  echo "No signal mapped for $1"
  exit 1
fi

pkill -x "-SIGRTMIN+${number}" "${BAR}"
