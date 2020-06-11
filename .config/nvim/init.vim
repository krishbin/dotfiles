"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           plug                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-plug"{{{
call plug#begin('~/.config/nvim/plugged')
Plug 'bronson/vim-trailing-whitespace'
" Plug 'flazz/vim-colorschemes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dart-lang/dart-vim-plugin'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'pangloss/vim-javascript'
Plug 'morhetz/gruvbox'
call plug#end()
"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           default                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"default"{{{
" General configuration
set nu
set rnu                                  "line number
set hidden                               "allow buffer to change w/o saving
set lazyredraw                           "dont execute while running macros
" set termguicolors
set history=1000                         "remember last thousand commands
set showmatch                            "show matching bracket
set hlsearch                             "highlight the search results
set incsearch                            "highlight search results as you type
set splitbelow
set splitright
set backspace=indent,eol,start
set ruler
set colorcolumn=80
syntax enable
syntax on                                "syntax highlighting
set encoding=utf-8
set numberwidth=4
set autoread                             "autoread file if it is changed in buffer
"prgram specific
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set autochdir                            "autochange directory on the basis of what file you are editing
set clipboard^=unnamed                   "add system clipboard support
set clipboard^=unnamedplus
set wildmenu                             "command line completion
set cursorline
set path+=**
set fdm=marker                           "folding files
filetype indent on
filetype plugin on

if has("nvim")
set inccommand=nosplit                   "live find and replace
endif

"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           maping                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{
if has('nvim')
    "normal mode in terminal
    tnoremap <C-n> <C-\><C-n>
    "escape in terminal
    tnoremap <C-j> <esc>
endif

"make it easier to edit and quit files
":Q also quits vim
command! Q q
":E also acts as edit
command! E e
":Wq also writes and quits
command! Wq wq
":x also writes and quits
command! Wq x

"quit help file like man pages
autocmd Filetype help nmap <silent><buffer> q :q<CR>
"quit netrw with an additional leader key
autocmd Filetype netrw nmap <silent><buffer> <leader>q :q<CR>
"""""""""""""""""""
"markdown specific"
"""""""""""""""""""
autocmd Filetype markdown onoremap ih :<c-u>execute "normal! \
            \?^==\\+$\r:nohlsearch\rkvg_"<cr>

"""""""""""""""""""""""
"python specific      "
"""""""""""""""""""""""
"easily write statements
augroup python_file
    autocmd Filetype python set tabstop=4
    autocmd Filetype python set softtabstop=4
    autocmd Filetype python set shiftwidth=4
    autocmd Filetype python :iabbrev <buffer> iff if:<left>
    autocmd Filetype python :iabbrev <buffer> forr for:<left>
    autocmd Filetype python :iabbrev <buffer> classs class:<left>
    autocmd Filetype python :iabbrev <buffer> deff def:<left>
    "get into the statement body after it is complete
    autocmd Filetype python inoremap <C-b> <esc>A<cr>
    "automatically format current file according to pep8 standard, python autopep8
    "required
    autocmd Filetype python nnoremap <leader><C-s> :%!autopep8 %<cr>:w<cr>
augroup END


"""""""""""""""""""""""""""
"javascript and c specific"
"""""""""""""""""""""""""""
"
"easily write statements
autocmd Filetype javascript,cpp,c :iabbrev <buffer> iff if ()<left>
autocmd Filetype javascript,cpp,c :iabbrev <buffer> forr for ()<left>
"get inside statement body with curly braces already defined
autocmd Filetype javascript,cpp,c inoremap <C-b> <esc>A{<esc>o<esc>o}<esc>ki<tab>

"format c and cpp files
autocmd Filetype c,cpp nnoremap <leader><C-s> :%!clang-format %<cr>:w<cr>
"make json pretty
autocmd Filetype json nnoremap <leader><C-s> :%!python -m json.tool %<cr>:w<cr>


""""""""
"buffer"
""""""""
"
"easily switch between buffer
nnoremap <silent>]b :bn<cr>
nnoremap <silent>[b :bp<cr>
"quit buffer
nnoremap <silent><leader>bq :bp<cr>
"write file
nnoremap <leader>w :w!<cr>

"insert a html bare snippet
noremap ,htm :-1r $HOME/.config/nvim/snippets/base.html<cr>5j2f<i

"make space as the leader key
let mapleader = "\<Space>"
"change vim window quickly by leader hjkl
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
"indent all lines of the file
nnoremap <leader>ia gg=G<C-o>
"keep selecting the text after indenting in visual mode
"clear highlighting
nnoremap <silent><leader>ch :noh<CR>
"treat a long line like multiline if it appears in two line
nnoremap j gj
nnoremap k gk
"open a new tab
nnoremap <leader>to :<C-u>tabnew<cr>
"close a tab
nnoremap <leader>tc :<C-u>tabclose<cr>
"maximize a window that is focused
nnoremap <leader>z :wincmd _<cr>:wincmd \|<cr>
"minimize the maximized window
nnoremap <leader>Z :wincmd =<cr>
"FZF
nnoremap <C-p> :Files<cr>
"left explorer
nmap <leader>e :Lexplore<cr>
"open a file explorer
nmap <leader>o :Explore<cr>
"resize vimsplits with hjkl
nmap <leader>rh <C-w>5>
nmap <leader>rj <C-w>3-
nmap <leader>rk <C-w>3+
nmap <leader>rl <C-w>5<
"copy all the content of the file
nmap <leader>ya gg0VG"*y
"delete all content of the file
nmap <leader>da gg0VG"*d
"edit init.vim in a new tab
nmap <leader>vi :tabe $MYVIMRC<cr>
"source the init.vim file
nmap <silent><leader>so :source $MYVIMRC<cr>
vnoremap < <gv
vnoremap > >gv
"move a visual block up or down a line
vnoremap <silent><leader>k :move-2<CR>gv=gv
vnoremap <silent><leader>j :move'>+<CR>gv=gv
"operator to change on next.previous structures
onoremap in( :<C-u>normal! f(vi(<cr>
onoremap in" :<C-u>normal! f"vi"<cr>
onoremap in' :<C-u>normal! f'vi'<cr>
onoremap ip( :<C-u>normal! F)vi(<cr>
onoremap ip" :<C-u>normal! F"vi"<cr>
onoremap ip' :<C-u>normal! F'vi'<cr>
"Ctrl-j acts a escape
imap <C-j> <Esc>
nmap <C-j> <Esc>
vmap <C-j> <Esc>
"split vertical or horizontal and move cursor to the new split
map <leader>sh :split<cr><C-w>w
map <leader>sv :vsplit<cr><C-w>w
"Ctrl-s writes to the file
nmap <C-s> :w<cr>
imap <C-s> <Esc>:w<cr>

"remove the mapping from the arrow keys
map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           vim-set                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{
"""""""""""""""""""
"built into neovim"
"""""""""""""""""""
colorscheme gruvbox
" let g:gruvbox_contrast_dark="soft"
set background=dark
let g:python3_host_prog = "/usr/local/bin/python3"
let g:gruvbox_color_column="bg3"
let g:netrw_banner=0
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_browse_split = 0
let g:netrw_winsize=15

"""""""""
"airline"
"""""""""
let g:airline_theme='onedark'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#show_tabs = 0
" let g:airline#extensions#tabline#show_tab_count = 0
" let g:airline#extensions#tabline#show_tab_nr = 0
" let g:airline#extensions#tabline#show_close_button = 0
" let g:airline#extensions#tabline#buffers_label = 'b'
" let g:airline#extensions#tabline#tabs_label = 't'

"""""""""""""""
"YouCompleteMe"
"""""""""""""""
" let g:ycm_clangd_binary_path = '/usr/local/opt/llvm/bin/clangd'
" let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
" let g:ycm_min_num_of_chars_for_completion = 2
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_max_num_identifier_candidates = 10
" let g:ycm_clangd_uses_ycmd_caching = 1
" let g:ycm_max_num_candidates=25

"""""""""""
"syntastic"
"""""""""""
" let g:syntastic_error_symbol = '🛑'
" let g:syntastic_warning_symbol = '⚠'
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 2
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 1
" let g:syntastic_python_checkers = ['flake8']
" let g:syntastic_python_flake8_args = '--max-line-length=80 '
" let g:tsuquyomi_disable_quickfix = 1
" let g:syntastic_typescript_checkers = ['tsuquyomi']
" autocmd FileType typescript setlocal completeopt-=menu
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           statusline                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction


set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=\ %f
set statusline+=\ %y
set statusline+=\ %m

set statusline+=%=
set statusline+=%#PmenuSel#
set statusline+=\ [%{&fileencoding?&fileencoding:&encoding}]
set statusline+=\ %c
set statusline+=\ %p%%
set statusline+=\ %l:%L
set statusline+=\
"}}}
