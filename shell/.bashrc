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

include "/opt/google-cloud-cli/completion.bash.inc"
include "/opt/google-cloud-cli/path.bash.inc"
include "${HOME}/google-cloud-sdk/completion.bash.inc"
include "${HOME}/google-cloud-sdk/path.bash.inc"

include "/usr/share/fzf/completion.bash"
include "/usr/share/fzf/key-bindings.bash"

include "${HOME}/.opam/opam-init/init.sh"

# init zoxide
# eval "$(zoxide init bash)"

# start starship
eval "$(starship init bash)"
