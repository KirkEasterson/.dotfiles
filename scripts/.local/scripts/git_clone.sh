#!/usr/bin/env bash

if [ $# -eq 0 ]; then
	>&2 echo "Provide a git repository"
	return
fi

# magic regex: https://serverfault.com/a/917253
re="^(https|git)(:\/\/|@)([^\/:]+)[\/:]([^\/:]+)\/(.+).git*$"

url=$1
if [[ $url =~ $re ]]; then
	host=${BASH_REMATCH[3]}
	team=${BASH_REMATCH[4]}
	repo=${BASH_REMATCH[5]}
else
	>&2 echo "Provide a valid git repository"
	return
fi

dest="${HOME}/dev/$host/$team/$repo"
if ! [ -d "$dest" ]; then
	mkdir -p "$dest"
	git clone "$url" "$dest"
else
	>&2 echo "Repo already exists"
fi
