local o = vim.o
local g = vim.g
local a = vim.api

g.mapleader = ' '
g.maplocalleader = ','

o.updatetime = 800
o.foldlevelstart = 99
o.termguicolors = true
o.ignorecase = true -- Ignore case
o.confirm = true -- Disable 'no write'
o.scrolloff = 8 -- Lines from the cursor
o.incsearch = true -- Move cursor during search
o.splitright = true -- Splits open on the right
o.splitbelow = true -- Splits open on the bottom
o.wildmenu = true -- Command line completion mode
o.wildmode = 'full' -- Command line completion mode
o.hlsearch = true -- Highlight search results (enforce)
o.showmatch = true -- Show matching brackets/parenthesis
o.showmode = false -- Do not output message on the bottom
o.inccommand = 'nosplit' -- Show effects of command as you type in a split
o.tabstop = 4 -- Tabs are 4 spaces long BO
o.shiftwidth = 4 -- Number of space for autoindent BO
o.expandtab = true -- expand tab into space by default
o.shortmess = vim.o.shortmess .. 'c'
o.smartindent = true -- auto indent on new line (brackets for instance) BO
o.formatoptions = o.formatoptions:gsub('[cro]', '')

a.nvim_exec([[
" we have to set these window options here because vim.o won't accept them and vim.wo wont set for each window automatically
" and binding to an autocmd will mess with window that change those settings
set relativenumber
set nu
set cursorline
set linebreak
set foldmethod=expr
"set foldexpr=nvim_treesitter#foldexpr()
" Disable autocommenting on newline and retrieve last position
au BufWinEnter * exec "normal! g'\""
au FileType scheme set ft=query
au FileType c,cpp set tabstop=8 shiftwidth=8 noexpandtab
au FileType python set tabstop=4 shiftwidth=4 noexpandtab
au FileType markdown set tabstop=4 shiftwidth=4 conceallevel=2
au FileType typescriptreact,typescript,javascript,javascriptreact,lua set tabstop=2 shiftwidth=2
au FileType vim set fdm=marker
au TextYankPost * silent! lua require'vim.highlight'.on_yank({ timeout=500 })

autocmd Filetype help nmap <silent><buffer> q :q<CR>
autocmd Filetype help wincmd K
autocmd FileType tex nnoremap <F5> :silent VimtexCompile<CR>
autocmd FileType tex inoremap <F5> <esc>:silent VimtexCompile<CR>

cabbrev W w
cabbrev E e
cabbrev Wq wq
]], '')

require 'plugins'

local function map(mod, lhs, rhs, opt)
  a.nvim_set_keymap(mod, lhs, rhs, opt or {})
end

map('','Q','',{})
--close quickfix
map('n','Q',':cclose<CR>:lclose<CR>',{noremap=true,silent = true})
--change buffer
map('n',']b',':bn<cr>',{noremap=true,silent=true})
map('n','[b',':bp<cr>',{noremap=true,silent=true})
--change vim windows
map('n','<leader>h','<C-w>h',{noremap=true,nowait=true})
map('n','<leader>j','<C-w>j',{noremap=true,nowait=true})
map('n','<leader>k','<C-w>k',{noremap=true,nowait=true})
map('n','<leader>l','<C-w>l',{noremap=true,nowait=true})
--indent lines of a file
map('n','<leader>ia','m`gg=G``',{noremap=true})
--clear highlighting
map('n','<leader>ch',':noh<CR>',{noremap=true,silent=true})
--long single line as multiline
map('n','j','gj',{noremap=true})
map('n','k','gk',{noremap=true})
--newtab
map('n','<leader>to',':<C-u>tabnew<cr>',{noremap=true})
--move tab position
map('n','<A-Left>',':-tabmove<cr>',{noremap=true,silent=true})
map('n','<A-Right>',':+tabmove<cr>',{noremap=true,silent=true})
--maximize focused window
map('n','<leader>z',':wincmd _<cr>:wincmd \\|<cr>',{noremap=true})
--minimize focused window
map('n','<leader>Z',':wincmd =<cr>',{noremap=true})
--copy all of the file to clipboard
map('n','<leader>ya','m`gg0VG"*y``',{})
--delete the contents of file
map('n','<leader>ya','gg0VGd',{})
--openvimrc
map('n','<leader>vi',':tabe ~/.config/nvim/lua/init.lua',{})
--sourcevimrc
map('n','<leader>vi',':source $MYVIMRC',{})

--select the text even after indentation
map('v','<','<gv',{noremap=true})
map('v','>','>gv',{noremap=true})
--move a visual block up or down a line
map('v','<leader>k',':move-2<CR>gv=gv',{noremap=true,silent=true})
map('v','<leader>j',':move\'>+<CR>gv=gv',{noremap=true,silent=true})
--yank to clipboard
map('v','<leader>y','"*y',{noremap=true,silent=true})
--split it up
map('','<leader>sh',':split<cr>',{})
map('','<leader>sv',':vsplit<cr>',{})
--savefile
map('n','<C-s>',':w<cr>',{})
map('i','<C-s>','<Esc>:w<cr>',{})
map('n','<leader>aj','m`o<esc>``',{noremap=true,silent=true})
map('n','<leader>ak','m`o<esc>``',{noremap=true,silent=true})
map('c','<C-a>','<Home>',{})
map('c','<C-b>','<Left>',{})
map('c','<C-f>','<Right>',{})
--LuaTree
map('n','<leader>o',':LuaTreeToggle<cr>',{noremap=true})
map('n','<leader>r',':LuaTreeRefresh<cr>',{noremap=true})
map('n','<leader>n',':LuaTreeFindFile<CR>',{noremap=true})




g.tex_flavor = "latex"
g.vimtex_view_method = 'skim'

g.lightline = {
  colorscheme= 'gruvbox',
  active= {
    left= { { 'mode', 'paste' },
    { 'gitbranch' },{ 'readonly', 'absolutepath', 'modified' } },
    right= { {'lineinfo'},
    { 'percent' },
    { 'filetype', 'fileencoding'} } },
    component_function= {
      gitbranch= 'FugitiveHead',
    },
    component_type= {
      tabs= 'tabsel',
      readonly= 'error',
      close= ''
    }
  }


g.lightline.enable = {
    statusline= 1,
    tabline= 1
  }

  g.python3_host_prog="/usr/local/bin/python3"
