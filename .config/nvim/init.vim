" General configuration
set nu                       "line number
set hidden                   "allow buffer to change w/o saving
set lazyredraw               "dont execute while running macros
set history=1000             "remember last thousand commands
set showmatch                "show matching bracket
set hlsearch                 "highlight the search results
set incsearch
set backspace=indent,eol,start
set ruler
set colorcolumn=80
hi ColorColumn ctermbg=0 guibg=lightgrey
syntax enable
syntax on "syntax highlighting
set encoding=utf-8
set numberwidth=4

"prgram specific
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set inccommand=nosplit
set wildmenu
set cursorline
set path+=**
"detect file and indent accordingly
filetype indent on
filetype plugin on

source $HOME/.config/nvim/coc.vim

let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = 'E:'
let airline#extensions#coc#warning_symbol = 'W:'
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

if has('nvim')
    tnoremap <C-j> <C-\><C-n>
endif
command! Q q "Bind :Q to :q
command! E e "Bind :E to :e
command! Wq wq"Bind :E to :e
autocmd Filetype help nmap <silent><buffer> q :q<CR>
autocmd Filetype netrw nmap <silent><buffer> <leader>q :q<CR>
autocmd VimResized * :wincmd =

let g:netrw_banner=0
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_browse_split = 4
let g:netrw_winsize=25

let mapleader = "\<Space>"
nnoremap <silent><leader>h :noh<CR>
nnoremap j gj
nnoremap k gk
nnoremap <leader>z :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>Z :wincmd =<cr>
nnoremap <silent><leader>rr :!tmux send-keys -t 2 "python emaildb.py" C-m<cr>
nnoremap <silent><leader>rc :!tmux send-keys -t 2 "clear" C-m<cr>
nmap 0 ^
nmap <leader>e :Vexplore<cr>
nmap <leader>o :Explore<cr>
nmap <leader>rh <C-w>5>
nmap <leader>rj <C-w>3-
nmap <leader>rk <C-w>3+
nmap <leader>rl <C-w>5<
nmap <leader>ya gg0VG"*y
nmap <leader>da gg0VG"*d
nmap <leader>vi :tabe $MYVIMRC<cr> "open init.vim in a new tab
nmap <silent><leader>so :source $MYVIMRC<cr>
imap <C-j> <Esc>
nmap <C-j> <Esc>
vmap <C-j> <Esc>
map <leader>sh :split<cr><C-w>w
map <leader>sv :vsplit<cr><C-w>w
nmap <C-s> :w<cr>
imap <C-s> <Esc>:w<cr>

"remove the mappingfrom the arrow keys
map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>

" flutter mappings
nnoremap <silent> <leader>frr :CocCommand flutter.run<cr>
nnoremap <silent> <leader>hr :CocCommand flutter.dev.hotReload<cr>
nnoremap <silent> <leader>pg :CocCommand flutter.pub.get<cr>

"#################################vim_plug##################################
call plug#begin('~/.config/nvim/plugged')
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dart-lang/dart-vim-plugin'
call plug#end()

colorscheme xoria256
let g:airline_theme='onedark'


" function! GitBranch()
"   return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
" endfunction

" function! StatuslineGit()
"   let l:branchname = GitBranch()
"   return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
" endfunction


" set statusline=
" set statusline+=%#PmenuSel#
" set statusline+=%{StatuslineGit()}
" set statusline+=\ %f
" set statusline+=\ %y
" set statusline+=\ %m

" set statusline+=%=
" set statusline+=%#PmenuSel#
" set statusline+=\ [%{&fileencoding?&fileencoding:&encoding}]
" set statusline+=\ %c
" set statusline+=\ %p%%
" set statusline+=\ %l:%L
" set statusline+=\
