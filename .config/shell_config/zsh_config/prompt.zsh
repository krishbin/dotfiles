#git-integration
autoload -Uz vcs_info
precmd() {
        vcs_info
}
zstyle ':vcs_info:git*' formats "%F{107}[%b%F{109}%m%u%c%f"
zstyle ':vcs_info:*' actionformats '%F{107}[%F{5}%F{5}[%F{2}%b%F{8}|%F{1}%a%F{5}]%f'
zstyle ':vcs_info:*' enable git
setopt PROMPT_SUBST

parse_git_branch() {
        git_id="$(git rev-parse --short HEAD 2> /dev/null)"
        if [[ $? == 0 ]]; then
                echo "%F{8}@%F{137}${git_id}%F{107}]"
        fi
}

# An exclamation point if the previous command did not complete successfully
function PR_ERROR() {
        echo "%(?..%(!.%F{92}.%F{160})%B!%b%{$reset_color%} )"
}

# The arrow symbol that is used in the prompt
PR_ARROW_CHAR="%B>%b"
# The arrow in red (for root) or violet (for regular user)
function PR_ARROW() {
        echo "%(!.%F{160}.%F{134})${PR_ARROW_CHAR}%{$reset_color%}"
}
#prompt setup
NEWLINE=$'\n'
# PROMPT='${NEWLINE}'
# PROMPT='%F{172}%n%f ' #username
# PROMPT+=' at '
# PROMPT+='%F{3}${${(%):-%m}#Krishbins-}%f' #hostname
# PROMPT+=' in '
PROMPT='%F{172}${PWD/#$HOME/~}%f ' #directory
PROMPT+='${vcs_info_msg_0_}$(parse_git_branch) ' #git info
PROMPT+='${NEWLINE}$(PR_ERROR)$(PR_ARROW)'
