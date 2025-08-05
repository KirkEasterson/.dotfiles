#!/usr/bin/env bash

# Taken from:
#	- https://gist.github.com/keenahn/7772d481d4e0502727266f2429984488

# Check if the remote 'origin' has a 'main' branch
if git show-branch remotes/origin/main >/dev/null 2>&1; then
	echo -n "main"
elif git show-branch remotes/origin/master >/dev/null 2>&1; then
	echo -n "master"
else
	exit 1
fi
