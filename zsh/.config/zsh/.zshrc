[ -z "${ZPROF}" ] || zmodload zsh/zprof

source "${HOME}/.config/shell/commonrc"

HISTSIZE=100000
SAVEHIST=100000
if [[ ! -a "${XDG_CACHE_HOME}/zsh/history" ]]; then
	mkdir -p "${XDG_CACHE_HOME}/zsh" >/dev/null 2>&1
	touch "${XDG_CACHE_HOME}/zsh/history"
fi
HISTFILE="${XDG_CACHE_HOME}/zsh/history"
setopt INC_APPEND_HISTORY_TIME
KEYTIMEOUT=1

setopt complete_aliases

# this allows for tab-completion of program args
if [ "$(find ${ZDOTDIR}/.zcompdump -mtime +1)" ] ; then
    autoload -Uz compinit; compinit
fi
autoload -Uz compinit; compinit -C

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
	 [[ $1 = 'block' ]]; then
	echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
	   [[ ${KEYMAP} == viins ]] ||
	   [[ ${KEYMAP} = '' ]] ||
	   [[ $1 = 'beam' ]]; then
	echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Use beam shape cursor on startup.
echo -ne '\e[5 q'

# Use beam shape cursor for each new prompt.
_fix_cursor() {
   echo -ne '\e[5 q'
}

precmd_functions+=(_fix_cursor)

# tmux sessionizer
tmux_sessionizer() tmux_sessionizer.sh
zle -N tmux_sessionizer
bindkey -M viins '^F' tmux_sessionizer
bindkey -M vicmd '^F' tmux_sessionizer

# like my nvim mapping
bindkey -M viins '^Y' autosuggest-accept

# non-vi backspace in insert mode
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char

if [ -f '/usr/share/fzf/completion.zsh' ]; then
	source '/usr/share/fzf/completion.zsh'
fi
if [ -f '/usr/share/fzf/key-bindings.zsh' ]; then
	source '/usr/share/fzf/key-bindings.zsh'
	zle -N fzf-history-widget{,}
	bindkey -M vicmd "/" fzf-history-widget
fi

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)

# bootstrap antidote
if [[ ! -d ${ZDOTDIR}/antidote ]]; then
	git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR}/antidote
fi
source ${ZDOTDIR}/antidote/antidote.zsh
antidote load

# configuration for plugins
ZSH_AUTOSUGGEST_STRATEGY=( history )
ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )

# gcloud configuration
if [ -f '${HOME}/google-cloud-sdk/path.zsh.inc' ]; then . '${HOME}/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '${HOME}/google-cloud-sdk/completion.zsh.inc' ]; then . '${HOME}/google-cloud-sdk/completion.zsh.inc'; fi

# opam configuration
[[ ! -r '${HOME}/.opam/opam-init/init.zsh' ]] || source '${HOME}/.opam/opam-init/init.zsh'  > /dev/null 2> /dev/null

# eval "$(direnv hook zsh)"
# eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

[ -z "${ZPROF}" ] || zprof
