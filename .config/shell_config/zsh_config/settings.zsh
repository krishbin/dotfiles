# initialize autocomplete
autoload -U compinit && compinit -i
zstyle ':completion:*' menu select=4
zmodload zsh/complist

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Initialize editing command line
autoload -U edit-command-line && zle -N edit-command-line

# Nicer history
HISTSIZE=1048576
HISTFILE="$HOME/.zsh_history"
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt incappendhistory
setopt extendedhistory

export EDITOR=nvim
KEYTIMEOUT=1

bindkey -v
# Movement
bindkey -a 'gg' beginning-of-buffer-or-history
bindkey -a 'G' end-of-buffer-or-history
# Undo
bindkey -a 'u' undo
bindkey -a '^R' redo
# Edit line
bindkey -a '^V' edit-command-line
#enter vi mode in terminal
bindkey -s '^v' '\e'
# Backspace
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char
bindkey "^A"      beginning-of-line
bindkey "^U"      kill-whole-line
bindkey "^E"      end-of-line
bindkey "^D"      delete-char
bindkey "^F"      forward-char
bindkey "^B"      backward-char

# Use incremental search
bindkey "^R" history-incremental-search-backward

# Disable shell builtins
disable r

