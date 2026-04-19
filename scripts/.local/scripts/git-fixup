#!/usr/bin/env bash

set -eu -o pipefail

git log \
	-n 50 \
	--pretty=format:'%h %s' \
	--no-merges |
	fzf |
	cut -c -7 |
	xargs -o git commit --fixup
