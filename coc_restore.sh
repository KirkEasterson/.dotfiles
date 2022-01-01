#!/bin/bash

coc_exts=(
	"coc-sh"
	"coc-cmake"
	"coc-go"
	"coc-html"
	"coc-tsserver"
	"coc-json"
	"coc-markdownlint"
	"coc-pyright"
)

set -o nounset	# error when referencing undefined variable
set -o errexit	# exit when command fails

# install extensions
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
if [ ! -f package.json ]; then
	echo '{"dependencies":{}}' > package.json
fi

npm install ${coc_exts[@]} --global-style --ignore-script --no-bin-links --no-package-lock --only=production
