source "$XDG_CONFIG_HOME/shell/commonrc"
export HISTFILE=/home/$USER/.cache/bash/history

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Set vi mode to default
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

# Ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

# opam configuration
[[ ! -r /home/kirk/.opam/opam-init/init.sh ]] || source /home/kirk/.opam/opam-init/init.sh  > /dev/null 2> /dev/null

complete -C /usr/bin/terraform terraform

# init zoxide
eval "$(zoxide init bash)"

# start starship
eval "$(starship init bash)"
