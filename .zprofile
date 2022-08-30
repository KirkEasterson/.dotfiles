if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep i3 || startx
fi
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
