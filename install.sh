#!/bin/bash
set -e

echo "Installing dotfiles"
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "${SCRIPT_DIR}" || exit
stow -S */ --adopt

# firefox files need specific installation
if [ -x "firefox" ]; then
	echo "Installing firefox config"

	# create firefox dir if it doesn't exists
	if [ ! -d "${HOME}/.mozilla/firefox" ]; then
		firefox -headless 2>/dev/null & disown
		sleep 1
		killall firefox
	fi

	FIREFOX_DIR=$(find ${HOME}/.mozilla/firefox/ -type d -regex ".*default-release$")
	stow -S firefox --target="${FIREFOX_DIR}"
fi

cd - > /dev/null || exit
