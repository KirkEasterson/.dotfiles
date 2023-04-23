# linux
if [ -f  '/home/linuxbrew/.linuxbrew/bin/brew' ]; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# macos
if [ -f  '/opt/homebrew/bin/brew' ]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep i3 || startx
fi

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export DOTFILES=$HOME/.dotfiles
export BROWSER=firefox
export BROWSER_SECONDARY=chromium
export TERMINAL=wezterm
export TERMINAL_SECONDARY=alacritty
export FILEMANAGER=pcmanfm
export EDITOR=nvim
export VISUAL=nvim
