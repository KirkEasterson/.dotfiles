# zmodload zsh/zprof # uncomment for profiling
source ~/.config/shell/commonrc

# ensure history file exists
if [[ ! -a "$HOME/.cache/zsh/history" ]]; then
	mkdir -p "$HOME/.cache/zsh" >/dev/null 2>&1
	touch "$HOME/.cache/zsh/history"
fi

HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.cache/zsh/history
setopt INC_APPEND_HISTORY_TIME
export KEYTIMEOUT=1

if [ -f '$HOME/google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '$HOME/google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/google-cloud-sdk/completion.zsh.inc'; fi

# opam configuration
[[ ! -r /home/kirk/.opam/opam-init/init.zsh ]] || source /home/kirk/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# Basic auto/tab complete
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)

if [ -f '/usr/bin/terraform ' ]; then . complete -o nospace -C /usr/bin/terraform terraform; fi

# bootstrap antidote
[[ ! -d ${XDG_CONFIG_HOME:-~}/zsh/antidote ]] &&
	git clone --depth=1 https://github.com/mattmc3/antidote.git ${XDG_CONFIG_HOME:-~}/zsh/antidote
source ${XDG_CONFIG_HOME:-~}/zsh/antidote/antidote.zsh
antidote load

# configuration for plugins
ZSH_AUTOSUGGEST_STRATEGY=( history )
ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )

function zvm_after_init() {
  # Like my nvim binding
  zvm_bindkey viins '^Y' autosuggest-accept
}

# init zoxide
eval "$(zoxide init zsh)"

# znap eval starship 'starship init zsh --print-full-init'
eval "$(starship init zsh)"
# zprof # uncomment for profiling

# export NVM_DIR="$HOME/.config/nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
