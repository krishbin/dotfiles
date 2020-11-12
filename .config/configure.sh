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

config submodule init

config submodule update

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install autojump bat cmake dark-mode exa fd fzf gh gitui glfw glm grep llvm lua luajit luarocks ncdu neovim nettle node openssl@1.1 pkg-config python@3.8 python@3.9 ripgrep texlab tldr tmux tree tree-sitter

brew cask install alfred appcleaner dash discord dropbox eul google-chrome hammerspoon iina iterm2 keka macdown macvim notion skim transmission

source ~/.zshrc
