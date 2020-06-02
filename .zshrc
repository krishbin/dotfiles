
#zsh_setup
for f in ~/.config/shell_config/zsh_config/*(.); do source "$f"; done

fpath=( "$HOME/.zfunctions" $fpath )

source ~/.config/shell_config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/.config/shell_config/zsh-autosuggestions/zsh-autosuggestions.zsh

for file in ~/.config/shell_config/zsh_plugins/*(.); do source "$file"; done

export TERMINAL='alacritty'

#flutter path
export PATH="$PATH:/usr/local/flutter/bin"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
