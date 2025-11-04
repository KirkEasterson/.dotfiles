#!/usr/bin/env bash

if [ $# -eq 0 ]; then
	>&2 echo "Provide a branch name"
	exit 1
fi

date=$(date "+%Y-%m-%d-%H-%M-%S")
git checkout -b "kirk/${1}_${date}"
