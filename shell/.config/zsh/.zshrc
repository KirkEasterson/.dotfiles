[ -z "${ZPROF}" ] || zmodload zsh/zprof

source "${HOME}/.config/shell/commonrc"

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME}/zsh/history"

# immediately write to history file, not on shell exit
setopt inc_append_history_time

# remove duplicates first
setopt hist_expire_dups_first

# don't write duplicates
setopt hist_ignore_dups

# expand aliases in history
setopt no_complete_aliases

# trim empty space before writing to history
setopt hist_reduce_blanks

# fast switch to vi normal mode
KEYTIMEOUT=1

# https://gist.github.com/ctechols/ca1035271ad134841284?permalink_comment_id=4624611#gistcomment-4624611
autoload -Uz compinit
if [ "$(find ${ZDOTDIR}/.zcompdump -mtime 1)" ]; then
	compinit
fi
compinit -C

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

source <(fzf --zsh)

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

# configuration for plugins
ZSH_AUTOSUGGEST_STRATEGY=(history)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# eval "$(direnv hook zsh)"
# eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

[ -z "${ZPROF}" ] || zprof
