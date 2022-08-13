export HISTFILE=/home/$USER/.cache/bash/history

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	startx
fi
