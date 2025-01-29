source "$HOME/.config/shell/env"

# run profile if not in tmux
if [ -n "$TMUX" ]; then
	source "$HOME/.config/shell/profile"
fi
