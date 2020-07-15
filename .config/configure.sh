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

source ~/.zshrc
