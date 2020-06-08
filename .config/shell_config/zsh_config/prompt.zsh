#git-integration
autoload -Uz vcs_info
precmd() {vcs_info}
zstyle ':vcs_info:git*' formats "%F{28}(%b)%F{214}%r %m%u%c%f"
zstyle ':vcs_info:*' enable git
setopt PROMPT_SUBST


# An exclamation point if the previous command did not complete successfully
function PR_ERROR() {
    echo "%(?..%(!.%F{92}.%F{124})%B!%b%{$reset_color%} )"
}

# The arrow symbol that is used in the prompt
PR_ARROW_CHAR=">"

# The arrow in red (for root) or violet (for regular user)
function PR_ARROW() {
    echo "%(!.%F{124}.%F{135})${PR_ARROW_CHAR}%{$reset_color%}"
}
#prompt setup
NEWLINE=$'\n'
# PROMPT='${NEWLINE}'
# PROMPT='%F{172}%n%f' #username
# PROMPT+=' at '
# PROMPT+='%F{3}${${(%):-%m}#Krishbins-}%f' #hostname
# PROMPT+=' in '
PROMPT='%F{43}${PWD/#$HOME/~}%f ' #directory
PROMPT+='${vcs_info_msg_0_} ' #git info
PROMPT+='${NEWLINE}$(PR_ERROR)$(PR_ARROW)'
