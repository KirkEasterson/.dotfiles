if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep i3 || startx
fi

if [ -f  '/home/linuxbrew/.linuxbrew/bin/brew' ]; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
