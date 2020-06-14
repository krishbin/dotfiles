#zsh_setup
for f in ~/.config/shell_config/zsh_config/*(.); do source "$f"; done

fpath=( "$HOME/.zfunctions" $fpath )

for file in ~/.config/shell_config/zsh_plugins/*(.); do source "$file"; done

export TERMINAL='alacritty'

[[ -s /Users/krispy/.autojump/etc/profile.d/autojump.sh ]] && source /Users/krispy/.autojump/etc/profile.d/autojump.sh

source ~/.config/shell_config/zsh-autosuggestions/zsh-autosuggestions.zsh

#flutter path
export PATH="$PATH:/usr/local/flutter/bin"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
export PATH="/usr/local/opt/llvm/bin:$PATH"
export FZF_DEFAULT_COMMAND="rg --files --hidden"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PYTHONSTARTUP=~/.pythonrc
