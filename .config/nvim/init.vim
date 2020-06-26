""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           plug                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-plug"{{{
call plug#begin('~/.config/nvim/plugged')
Plug 'bronson/vim-trailing-whitespace'
" Plug 'flazz/vim-colorschemes'
Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dart-lang/dart-vim-plugin'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'pangloss/vim-javascript'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
call plug#end()
"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           default                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"default"{{{
" General configuration
set nu
set rnu                                  "line number
set guifont=JetBrains\ Mono:h12
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
set undodir=~/.config/nvim/vimdid
" set clipboard^=unnamed                   "add system clipboard support
" set clipboard^=unnamedplus
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
map Q <nop>
nnoremap <silent> Q :cclose<CR>:lclose<CR>
nnoremap <leader>W :wq<cr>
if has('nvim')
    "normal mode in terminal
    tnoremap <C-n> <C-\><C-n>
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

autocmd Filetype dart nnoremap <leader>rr :CocCommand flutter.run<cr>
autocmd Filetype dart nnoremap <leader>re :CocCommand flutter.dev.hotReload<cr>
autocmd Filetype dart nnoremap <leader>rs :CocCommand flutter.dev.hotRestart<cr>
autocmd Filetype dart nnoremap <leader>pg :CocCommand flutter.pub.get<cr>

"quit help file like man pages
autocmd Filetype help nmap <silent><buffer> q :q<CR>
autocmd Filetype help wincmd K
"quit netrw with an additional leader key
autocmd Filetype netrw nmap <silent><buffer> <leader>q :q<CR>
"""""""""""""""""""
"markdown specific"
"""""""""""""""""""
" autocmd Filetype markdown onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
"""""""""""""""""""""""
"python specific      "
"""""""""""""""""""""""
"easily write statements
autocmd Filetype python :inoreabbrev <buffer> iff if:<left>
autocmd Filetype python :inoreabbrev <buffer> eliff elif:<left>
autocmd Filetype python :inoreabbrev <buffer> forr for:<left>
autocmd Filetype python :inoreabbrev <buffer> classs class:<left>
autocmd Filetype python :inoreabbrev <buffer> deff def:<left>
"get into the statement body after it is complete
autocmd Filetype python inoremap <C-b> <esc>A<cr>
"automatically format current file according to pep8 standard, python autopep8
"required
autocmd Filetype python nnoremap <leader><C-s> :w!<cr>:%!autopep8 %<cr>:w<cr>:%!isort -d %<cr>:w<cr>


"""""""""""""""""""""""""""
"javascript and c specific"
"""""""""""""""""""""""""""
"
"easily write statements
autocmd Filetype javascript,cpp,c :inoreabbrev <buffer> iff if ()<left>
autocmd Filetype javascript,cpp,c :inoreabbrev <buffer> forr for ()<left>
autocmd Filetype javascript,cpp,c :inoreabbrev <buffer> clog console.log()<left>
autocmd Filetype javascript,cpp,c :inoreabbrev <buffer> elseif else if ()<left>
autocmd Filetype javascript :inoreabbrev <buffer> func function
autocmd Filetype javascript inoremap <C-n> ()<left>
autocmd Filetype javascript nnoremap <leader>rr :silent !tmux send-keys -t 1 "deno"" ""run"" "% "C-m"<cr>
autocmd Filetype javascript nnoremap <leader>cl :silent !tmux send-keys -t 1 "C-l"<cr>
"get inside statement body with curly braces already defined
autocmd Filetype javascript,cpp,c inoremap <C-b> <esc>A{<esc>o<esc>o}<esc>ki<tab>

"format c and cpp files
autocmd Filetype c,cpp nnoremap <leader><C-s> :%!clang-format %<cr>:w<cr>
"make json pretty
autocmd Filetype json nnoremap <leader><C-s> :w!<cr>:%!python -m json.tool %<cr>:w<cr>


""""""""
"buffer"
""""""""
"
"easily switch between buffer
nnoremap <silent>]b :bn<cr>
nnoremap <silent>[b :bp<cr>
nnoremap <silent><C-q> :wq<cr>

"insert a html bare snippet
nnoremap ,htm :-1r $HOME/.config/nvim/snippets/base.html<cr>5j2f<i

nnoremap ,py :-1r $HOME/.config/nvim/snippets/main.py<cr>o

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
nnoremap <leader><C-p> :Buffers<cr>
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
nmap <leader>dj m`jdd``
nmap <leader>dk m`kdd``
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
"split vertical or horizontal and move cursor to the new split
map <leader>sh :split<cr>
map <leader>sv :vsplit<cr>
"Ctrl-s writes to the file
nmap <C-s> :w<cr>
imap <C-s> <Esc>:w<cr>
nnoremap <leader>aj m`o<esc>``
nnoremap <leader>ak m`O<esc>``
"remove the mapping from the arrow keys
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           vim-set                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{
"""""""""""""""""""
source $HOME/.config/nvim/coc.vim
"built into neovim"
"""""""""""""""""""
colorscheme gruvbox
" let g:gruvbox_contrast_dark="soft"
set background=dark
let g:highlightedyank_highlight_duration = 200
autocmd BufNewFile,BufRead /private/* set noautoindent filetype=mail wm=0 tw=78 nonumber digraph nolist nopaste

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! StatusDiagnosticError() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return ''| endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E:' . info['error'])
  endif
  return join(msgs, ' ')
endfunction

function! StatusDiagnosticWarning() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return ''| endif
  let msgs = []
  if get(info, 'warning', 0)
    call add(msgs, 'W:' . info['warning'])
  endif
  return join(msgs, ' ')
endfunction

function! GetPythonEnv() abort
    let msg = get(g:, 'coc_status', '')
    if &ft=='python'
        return strpart(msg, 21)
    else
        return msg
    endif
endfunction

let g:lightline = {
            \ 'colorscheme': 'deus',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'gitbranch' ],[ 'readonly', 'absolutepath'],[ 'modified' ] ],
		    \ 'right': [ ['cocstatuserror','cocstatuswarn', 'lineinfo'],
		    \            [ 'percent' ],
		    \            [ 'filetype','pyenv', 'fileencoding'] ] },
            \ 'component_function': {
            \   'gitbranch': 'FugitiveHead',
            \   'pyenv': 'GetPythonEnv'
            \ },
            \ 'component_expand': {
            \   'cocstatuserror': 'StatusDiagnosticError',
            \   'cocstatuswarn': 'StatusDiagnosticWarning',
            \ },
            \ 'component_type': {
            \   'cocstatuserror': 'error',
            \   'cocstatuswarn': 'warn',
            \ }
            \ }

let g:lightline.enable = {
            \ 'statusline': 1,
            \ 'tabline': 1
            \ }

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
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
" let g:airline_theme='onedark'
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
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
