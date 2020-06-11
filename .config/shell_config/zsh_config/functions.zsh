# No arguments: `git status`
# With arguments: acts like `git`
g() {
    if [[ $# -gt 0 ]]; then
        git "$@"
    else
        git status
    fi
}

cg() {
    if [[ $# -gt 0 ]]; then
        config "$@"
    else
        config status
    fi
}

#makedir and change into it
function mcd() {
    mkdir -p "$1" && cd "$1";
}

#enable autocd
set -o AUTO_CD

#enable autocorrect
set -o CORRECT

#git commit
function cgc(){
    config commit -m "$1"
}

function cpp(){
    if [[ $# -eq 2 ]]
    then
        gcc -lstdc++ $1 -o $2
        ./$2
    fi
    if [[ $# -eq 1 ]]
    then
        gcc -lstdc++ $1 -o ${${1}%.*}
    fi
}


#autojum zsh

#tmux

function nv(){
    case $1 in
        plugin)
            nvim $HOME/.config/nvim/plug.vim
            ;;
        init)
            nvim $HOME/.config/nvim/init.vim
            ;;
        statusline)
            nvim $HOME/.config/nvim/statusline.vim
            ;;
        map)
            nvim $HOME/.config/nvim/map.vim
            ;;
        default)
            nvim $HOME/.config/nvim/default.vim
            ;;
        vim_set)
            nvim $HOME/.config/nvim/vim_set.vim
            ;;
        *)
            nvim $HOME/.config/nvim/map.vim
            ;;
    esac
}
