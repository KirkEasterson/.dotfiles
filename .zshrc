source ~/.config/shell/commonrc

HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.cache/zsh/history
setopt INC_APPEND_HISTORY_TIME
export KEYTIMEOUT=1

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
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

# Download Znap, if it's not there yet.
[[ -f ~/.config/zsh/plugins/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.config/zsh/plugins/zsh-snap
source ~/.config/zsh/plugins/zsh-snap/znap.zsh

# configuration for plugins
zstyle ':autocomplete:recent-dirs' no
zstyle ':autocomplete:*' widget-style menu-select
zstyle ':autocomplete:*' min-input 1
zstyle ':autocomplete:*' insert-unambiguous yes
ZSH_AUTOSUGGEST_STRATEGY=( history )
ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )

# zsh plugins
znap source zsh-users/zsh-autosuggestions
znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-syntax-highlighting

# Use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' down-line-or-history
bindkey -M menuselect 'k' up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# Use emacs next/prev bindings
# TODO: make these cycle through the completion options, and act as 'Tab' does
# TODO: prevent 'Tab' from cycling. It should just insert the unambiguous substring
bindkey -M menuselect '^n' up-line-or-select
bindkey -M menuselect '^p' down-line-or-select

# Like my nvim binding
bindkey '^Y' autosuggest-accept
bindkey -M menuselect -r '\t'

# TODO: try to use this with curl so I don't need to add the install to ansible
# TODO: checkout powerlevel10k
znap eval starship 'starship init zsh --print-full-init'
znap prompt

