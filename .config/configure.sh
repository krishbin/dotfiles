alias config='/usr/bin/git --work-tree=$HOME --git-dir=$HOME/.mycfg/'

git clone --bare https://github.com/krishbin/dotfiles.git $HOME/.mycfg

config checkout

if [[ $? != 1 ]]; then
        echo "dublicate file exists, backing up and checking out"
        mkdir -p .config-backup && \
                config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
                xargs -I{} mv {} .config-backup/{}
        config checkout
fi

config config --local status.showUntrackedFiles no

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install alexjs autojump bat dark-mode exa fzf git gmp gnupg grep llvm lua luajit mas neovim node pass proselint python@3.8 reattach-to-user-namespace ripgrep ruby sqlite telnet tldr tmux tree

source ~/.zshrc
