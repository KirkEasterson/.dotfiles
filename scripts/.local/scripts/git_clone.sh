#!/usr/bin/env bash

print_usage() {
	cat <<EOF
Usage: $(basename "$0") [-b] -r url

-r=[url]    URL to the repo, must be valid
-b          Clone a bare repo for worktrees
EOF
}

clone_bare() {
	# https://www.tomups.com/posts/git-worktrees/
	cd "$dest" || exit 1
	git clone --bare "$url" .bare
	echo "gitdir: ./.bare" >.git
	git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
	git fetch origin
	cd - || exit 1
}

clone() {
	git clone "$url" "$dest"
}

bare='false'
url=''

while getopts 'br:' flag; do
	case "${flag}" in
	b) bare='true' ;;
	r) url="${OPTARG}" ;;
	*)
		print_usage
		exit 1
		;;
	esac
done

if [ -z "$url" ]; then
	print_usage
	exit 1
fi

# https://serverfault.com/a/917253
url_regex="^(https|git|ssh:\/\/git)(:\/\/|@)([^\/:]+)[\/:]([^\/:]+)\/(.+).git*$"

if [[ $url =~ $url_regex ]]; then
	host=${BASH_REMATCH[3]}
	team=${BASH_REMATCH[4]}
	repo=${BASH_REMATCH[5]}
else
	>&2 echo "Provide a valid git repository"
	exit 1
fi

dest="${HOME}/dev/$host/$team/$repo"
if [ -d "$dest" ]; then
	>&2 echo "Repo already exists"
fi

mkdir -p "$dest"
if [ "$bare" == "true" ]; then
	clone_bare
else
	clone
fi
