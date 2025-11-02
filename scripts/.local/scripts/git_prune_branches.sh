#!/usr/bin/env bash

set -eux -o pipefail

# delete all branches that have been merged to the default branch

default_branch=$(git-default-branch.sh)
git branch --merged "origin/${default_branch}" |
	cut -c 3- |
	grep -v "^${default_branch}$" |
	xargs git branch -d
