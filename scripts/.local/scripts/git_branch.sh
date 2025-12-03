#!/usr/bin/env bash

if [ $# -eq 0 ]; then
	>&2 echo "Provide a branch name"
	exit 1
fi

date=$(date "+%Y-%m-%d-%H-%M-%S")
branch_name=${USER}/${1}_${date}

git checkout -b "$branch_name"
