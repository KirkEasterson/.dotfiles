# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source "${HOME}/.config/shell/commonrc"
export HISTFILE=${HOME}/.cache/bash/history

# enable bash completion in interactive shells
if ! shopt -oq posix; then
	# TODO: iterate through these dirs and source all files in them

	if [ -d /usr/share/bash-completion/bash_completion ]; then
		for f in /usr/share/bash-completion/bash_completion/*; do
			source "$f"
		done
	elif [ -d /usr/share/bash-completion/completions ]; then
		for f in /usr/share/bash-completion/completions/*; do
			source "$f"
		done
	elif [ -d /etc/bash_completion ]; then
		for f in /etc/bash_completion/*; do
			source "$f"
		done
	fi
fi

# Set vi mode to default
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

# Ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

complete -C /usr/bin/terraform terraform

if [ -f "/opt/google-cloud-cli/completion.bash.inc" ]; then
	source "/opt/google-cloud-cli/completion.bash.inc"
fi
if [ -f "/opt/google-cloud-cli/path.bash.inc" ]; then
	source "/opt/google-cloud-cli/path.bash.inc"
fi
if [ -f "${HOME}/google-cloud-sdk/completion.bash.inc" ]; then
	source "${HOME}/google-cloud-sdk/completion.bash.inc"
fi
if [ -f "${HOME}/google-cloud-sdk/path.bash.inc" ]; then
	source "${HOME}/google-cloud-sdk/path.bash.inc"
fi

if [ -f "/usr/share/fzf/completion.bash" ]; then
	source "/usr/share/fzf/completion.bash"
fi
if [ -f "/usr/share/fzf/key-bindings.bash" ]; then
	source "/usr/share/fzf/key-bindings.bash"
fi

if [ -f "${XDG_DATA_HOME}/opam/opam-init/init.sh" ]; then
	source "${XDG_DATA_HOME}/opam/opam-init/init.sh"
fi

if [ -x "$(command -v wt)" ]; then eval "$(command wt config shell init bash)"; fi
if [ -x "$(command -v direnv)" ]; then eval "$(direnv hook bash)"; fi
if [ -x "$(command -v zoxide)" ]; then eval "$(zoxide init bash)"; fi
if [ -x "$(command -v starship)" ]; then eval "$(starship init bash)"; fi
