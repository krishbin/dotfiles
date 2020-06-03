
if has('nvim')
    tnoremap <C-j> <C-\><C-n>
endif
command! Q q "Bind :Q to :q
command! E e "Bind :E to :e
command! Wq wq"Bind :E to :e
autocmd Filetype help nmap <silent><buffer> q :q<CR>
autocmd Filetype netrw nmap <silent><buffer> <leader>q :q<CR>
autocmd VimResized * :wincmd =

let mapleader = "\<Space>"
nnoremap <silent><leader>h :noh<CR>
nnoremap j gj
nnoremap k gk
nnoremap <leader>z :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>Z :wincmd =<cr>
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

