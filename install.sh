#!/bin/bash
set -e

has_dirs() {
	for f do
		[ -d "$f" ] && return
	done
	false
}

echo "Installing dotfiles"
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "${SCRIPT_DIR}" || exit
stow -S */ --adopt

# firefox files need specific installation
if [ -x "firefox" ]; then
	mkdir -p "${HOME}/.mozilla/firefox"

	# create firefox dir if it doesn't exists
	if [ ! -d "${HOME}/.mozilla/firefox" ]; then
	fi

	if has_dirs "${HOME}/.mozilla/firefox/*.default-release"; then
		echo "Firefox profile directory doesn't exist. Creating..."
		firefox -headless 2>/dev/null & disown
		sleep 5
		killall firefox
	fi

	FIREFOX_DIR=$(find ${HOME}/.mozilla/firefox/ -type d -regex ".*default-release$")

	echo "Installing firefox config to ${FIREFOX_DIR}"
	stow -S firefox --target="${FIREFOX_DIR}"
fi

cd - > /dev/null || exit
