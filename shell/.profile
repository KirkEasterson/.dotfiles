# # init keyring
# eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
# # export keyring
# export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CONFIG_DIRS="/etc/xdg "
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_STATE_DIRS="/usr/local/share/:/usr/share/"
export XDG_CACHE_HOME="$HOME/.cache"
# export XDG_RUNTIME_DIR=""

export LANG="en_US.UTF-8"
export LC_CTYPE="nb_NO.UTF-8"
export LC_NUMERIC="nb_NO.UTF-8"
export LC_TIME="nb_NO.UTF-8"
export LC_COLLATE="nb_NO.UTF-8"
export LC_MONETARY="nb_NO.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_PAPER="nb_NO.UTF-8"
export LC_NAME="nb_NO.UTF-8"
export LC_ADDRESS="nb_NO.UTF-8"
export LC_TELEPHONE="nb_NO.UTF-8"
export LC_MEASUREMENT="nb_NO.UTF-8"
export LC_IDENTIFICATION="nb_NO.UTF-8"

export DOTFILES="$HOME/.dotfiles"
export SCRIPTS="$HOME/scripts"
export BROWSER="firefox"
export BROWSER_SECONDARY="chromium"
export TERMINAL="wezterm"
export TERMINAL_SECONDARY="alacritty"
export FILEMANAGER="pcmanfm"
export EDITOR="nvim"
export VISUAL="nvim"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export SPACESHIP_CONFIG_FILE="$XDG_CONFIG_HOME/spaceship/spaceship.zsh"

export NVM_DIR="$XDG_DATA_HOME/nvm"

export GVIMINIT='let $MYGVIMRC = !has("nvim") ? "$XDG_CONFIG_HOME/vim/gvimrc" : "$XDG_CONFIG_HOME/nvim/init.gvim" | so $MYGVIMRC'
export VIMINIT='let $MYVIMRC = !has("nvim") ? "$XDG_CONFIG_HOME/vim/vimrc" : "$XDG_CONFIG_HOME/nvim/init.lua" | so $MYVIMRC'

export PATH="$PATH:$XDG_CONFIG_HOME/emacs/bin"

export GTK_RC_FILES="$XDG_CONFIG_HOME/gtk-1.0/gtkrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"

export ANSIBLE_HOME="$XDG_CONFIG_HOME/ansible"
export ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible.cfg"
export ANSIBLE_GALAXY_CACHE_DIR="$XDG_CACHE_HOME/ansible/galaxy_cache"

export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo/bin"
export PATH="$XDG_DATA_HOME/cargo/bin:$PATH"

export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"

export DOTNET_CLI_TELEMETRY_OPTOUT=true

export QT_QPA_PLATFORMTHEME="qt5ct"

export HOMEBREW_NO_EMOJI=1

#export WGETRC="$XDG_CONFIG_HOME/wgetrc"

export PATH="/var/lib/flatpak/exports/share:$PATH"
export PATH="$XDG_DATA_HOME/flatpak/exports/share:$PATH"

if [ -s ~/.Xmodmap ]; then
	xmodmap ~/.Xmodmap
fi

volumeicon &
blueman-applet &
cbatticon &
flameshot &
nm-applet &
# picom &
sxhkd &
udiskie -a &
# xremap .config/xremap/config.yml &
xcape -e "Shift_L=parenleft;Shift_R=parenright" &
light-locker --lock-after-screensaver=5 --lock-on-suspend --lock-on-lid --idle-hint &
eval $(dbus-launch --auto-syntax)