# zmodload zsh/zprof
source ~/.config/shell/commonrc

HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.cache/zsh/history
setopt INC_APPEND_HISTORY_TIME
export KEYTIMEOUT=1

if [ -f '$HOME/google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '$HOME/google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/google-cloud-sdk/completion.zsh.inc'; fi

# vi mode
bindkey -v '^?' backward-delete-char # hacky bug fix; don't remove

# forward/backward search in vi mode
bindkey -M vicmd '/' history-incremental-pattern-search-backward
bindkey -M vicmd '?' history-incremental-pattern-search-forward
bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M viins '^F' history-incremental-pattern-search-forward

# TODO: do this in a cleaner way
# Change cursor shape for different vi modes
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
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# # Basic auto/tab complete
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -C
_comp_options+=(globdots)

# bootstrap antidote
[[ ! -d ${XDG_CONFIG_HOME:-~}/zsh/antidote ]] &&
	git clone --depth=1 https://github.com/mattmc3/antidote.git ${XDG_CONFIG_HOME:-~}/zsh/antidote
source ${XDG_CONFIG_HOME:-~}/zsh/antidote/antidote.zsh
antidote load

# zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins.zsh
# [[ -f ${zsh_plugins:r}.txt ]] || touch ${zsh_plugins:r}.txt
# fpath+=(${ZDOTDIR:-~}/antidote)
# autoload -Uz $fpath[-1]/antidote
# if [[ ! $zsh_plugins -nt ${zsh_plugins:r}.txt ]]; then
#   (antidote bundle <${zsh_plugins:r}.txt >|$zsh_plugins)
# fi
# source $zsh_plugins

# configuration for plugins
ZSH_AUTOSUGGEST_STRATEGY=( history )
ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )

# # Use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' down-line-or-history
bindkey -M menuselect 'k' up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# # Use emacs next/prev bindings
# # TODO: make these cycle through the completion options, and act as 'Tab' does
# # TODO: prevent 'Tab' from cycling. It should just insert the unambiguous substring
bindkey -M menuselect '^n' up-line-or-select
bindkey -M menuselect '^p' down-line-or-select

# Like my nvim binding
bindkey '^Y' autosuggest-accept
bindkey -M menuselect -r '\t'

# init zoxide
eval "$(zoxide init zsh)"

# znap eval starship 'starship init zsh --print-full-init'
eval "$(starship init zsh)"
# zprof
