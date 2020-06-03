#git-integration
autoload -Uz vcs_info
precmd() {vcs_info}
zstyle ':vcs_info:git*' formats "%F{28}(%b)%F{214}%r %m%u%c%f"
zstyle ':vcs_info:*' enable git
setopt PROMPT_SUBST

#prompt setup
NEWLINE=$'\n'
# PROMPT='${NEWLINE}'
# PROMPT='%F{172}%n%f' #username
# PROMPT+=' at '
# PROMPT+='%F{3}${${(%):-%m}#Krishbins-}%f' #hostname
# PROMPT+=' in '
PROMPT='%F{43}${PWD/#$HOME/~}%f ' #directory
PROMPT+='${vcs_info_msg_0_} ' #git info
PROMPT+='${NEWLINE}>'
