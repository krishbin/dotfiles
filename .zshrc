#zsh_setup
for f in ~/.config/shell_config/config_zsh/*(.); do source "$f"; done

fpath=( "$HOME/.zfunctions" $fpath )

for file in ~/.config/shell_config/plugins_zsh/*(.); do source "$file"; done

export TERMINAL='iTerm'

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/.config/shell_config/zsh-autosuggestions/zsh-autosuggestions.zsh

export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/miniconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
	eval "$__conda_setup"
else
	if [ -f "/usr/local/miniconda/etc/profile.d/conda.sh" ]; then
		. "/usr/local/miniconda/etc/profile.d/conda.sh"
	else
		export PATH="/usr/local/miniconda/bin:$PATH"
	fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH=$PATH:/Users/krispy/Workshop/nand2tetris/tools
export PATH="/usr/local/opt/llvm/bin:$PATH"
