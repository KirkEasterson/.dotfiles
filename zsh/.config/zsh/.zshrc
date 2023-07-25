# zmodload zsh/zprof # uncomment for profiling
source "$XDG_CONFIG_HOME/shell/commonrc"

HISTSIZE=100000
SAVEHIST=100000
if [[ ! -a "$XDG_CACHE_HOME/zsh/history" ]]; then
	mkdir -p "$XDG_CACHE_HOME/zsh" >/dev/null 2>&1
	touch "$XDG_CACHE_HOME/zsh/history"
fi
HISTFILE="$XDG_CACHE_HOME/zsh/history"
setopt INC_APPEND_HISTORY_TIME
export KEYTIMEOUT=1

# Basic auto/tab complete
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
	compinit
	touch ${ZDOTDIR}/.zcompdump
else
	compinit -C
fi;
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)

# bootstrap antidote
if [[ ! -d ${XDG_CONFIG_HOME:-~}/zsh/antidote ]]; then
	git clone --depth=1 https://github.com/mattmc3/antidote.git ${XDG_CONFIG_HOME:-~}/zsh/antidote
fi
source ${XDG_CONFIG_HOME:-~}/zsh/antidote/antidote.zsh
antidote load

# configuration for plugins
ZSH_AUTOSUGGEST_STRATEGY=( history )
ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )

function zvm_after_init() {
  # Like my nvim binding
  zvm_bindkey viins '^Y' autosuggest-accept
}

# gcloud configuration
if [ -f '$HOME/google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '$HOME/google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/google-cloud-sdk/completion.zsh.inc'; fi

# opam configuration
[[ ! -r '$HOME/.opam/opam-init/init.zsh' ]] || source '$HOME/.opam/opam-init/init.zsh'  > /dev/null 2> /dev/null

eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
# zprof # uncomment for profiling
