export HISTFILE=/home/$USER/.cache/bash/history

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	startx
fi
