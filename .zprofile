if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep i3 || startx
fi

# linux
if [ -f  '/home/linuxbrew/.linuxbrew/bin/brew' ]; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# macos
if [ -f  '/opt/homebrew/bin/brew' ]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi
