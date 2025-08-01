[ -z "${ZPROF}" ] || zmodload zsh/zprof

source "${HOME}/.config/shell/commonrc"

HISTSIZE=100000
SAVEHIST=100000
if [[ ! -e "${XDG_CACHE_HOME}/zsh/history" ]]; then
	mkdir -p "${XDG_CACHE_HOME}/zsh" >/dev/null 2>&1
	touch "${XDG_CACHE_HOME}/zsh/history"
fi
HISTFILE="${XDG_CACHE_HOME}/zsh/history"
setopt INC_APPEND_HISTORY_TIME
KEYTIMEOUT=1

# show completions on the expanded alias
setopt no_complete_aliases

# build zcompdump only once per day
autoload -Uz compinit
if [ "$(find ${ZDOTDIR}/.zcompdump -mtime +1)" ]; then
	compinit
else
	compinit -C
fi

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

# https://www.reddit.com/r/zsh/comments/1dz79rj/comment/lce60fe/
tmux_sessionizer() {
	zle push-line
	BUFFER='tmux_sessionizer.sh'
	zle accept-line
}
zle -N tmux_sessionizer
bindkey -M viins '^F' tmux_sessionizer
bindkey -M vicmd '^F' tmux_sessionizer

# like my nvim mapping
bindkey -M viins '^Y' autosuggest-accept

# non-vi backspace in insert mode
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char

zle -N fzf-history-widget{,}
bindkey -M vicmd "/" fzf-history-widget

autoload -z edit-command-line
zle -N edit-command-line
bindkey -M vicmd '^X^E' edit-command-line

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)

include "/opt/google-cloud-cli/completion.zsh.inc"
include "/opt/google-cloud-cli/path.zsh.inc"
include "${HOME}/google-cloud-sdk/completion.zsh.inc"
include "${HOME}/google-cloud-sdk/path.zsh.inc"

include "/usr/share/fzf/completion.zsh"
include "/usr/share/fzf/key-bindings.zsh"

include "${HOME}/.opam/opam-init/init.zsh"

# bootstrap antidote
if [[ ! -d ${ZDOTDIR}/antidote ]]; then
	git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR}/antidote
fi

# # load on init
# source ${ZDOTDIR}/antidote/antidote.zsh
# antidote load

# lazy load
zsh_plugins=${ZDOTDIR:-$HOME}/.zsh_plugins
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
	(
		source ${ZDOTDIR}/antidote/antidote.zsh
		antidote bundle <${zsh_plugins}.txt >${zsh_plugins}.zsh
	)
fi
source ${zsh_plugins}.zsh

# fix for wl-copy causing shell to hang
# https://bbs.archlinux.org/viewtopic.php?pid=2173713#p2173713
function zsh-system-clipboard-set() {
	zsh-system-clipboard-set-${ZSH_SYSTEM_CLIPBOARD_METHOD} "$@" 2>/dev/null
}

# configuration for plugins
ZSH_AUTOSUGGEST_STRATEGY=(history)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# eval "$(direnv hook zsh)"
# eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

[ -z "${ZPROF}" ] || zprof
