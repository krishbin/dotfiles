
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
