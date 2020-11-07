local o = vim.o
local wo = vim.wo
local g = vim.g
local a = vim.api

g.mapleader = ' '
g.maplocalleader = ','

o.updatetime = 400
o.foldlevelstart = 99
o.termguicolors = true
o.ignorecase = true -- Ignore case
o.confirm = true -- Disable 'no write'
o.scrolloff = 4 -- Lines from the cursor
o.incsearch = true -- Move cursor during search
o.splitright = true -- Splits open on the right
o.splitbelow = true -- Splits open on the bottom
o.wildmenu = true -- Command line completion mode
o.wildmode = 'full' -- Command line completion mode
o.hlsearch = true -- Highlight search results (enforce)
o.showmatch = true -- Show matching brackets/parenthesis
o.showmode = false -- Do not output message on the bottom
o.inccommand = 'split' -- Show effects of command as you type in a split
o.tabstop = 4 -- Tabs are 4 spaces long BO
o.shiftwidth = 4 -- Number of space for autoindent BO
o.expandtab = true -- expand tab into space by default
o.shortmess = vim.o.shortmess .. 'c'
o.smartindent = true -- auto indent on new line (brackets for instance) BO
o.textwidth = 80
o.formatoptions = o.formatoptions:gsub('[cro]', '')


require'plugins'
require'_loadPlugins'
require'_lsp'.setup()
require'_telescope'.setup()
require'_nvimtree'.setup()
require'_diagnostic'.setup()
require'_snips'.setup()



a.nvim_exec([[
	" we have to set these window options here because vim.o won't accept them and vim.wo wont set for each window automatically
	" and binding to an autocmd will mess with window that change those settings

	set nu
	set rnu
	set colorcolumn=100
	set completeopt=menuone,noinsert,noselect
	set cursorline
	set linebreak
	if has("autocmd")
	filetype plugin indent on
	endif
	set foldmethod=expr
	set foldexpr=nvim_treesitter#foldexpr()
	" Disable autocommenting on newline and retrieve last position
	au BufWinEnter * exec "normal! g'\""
	au FileType scheme set ft=query
	au FileType c,cpp set tabstop=4 shiftwidth=4 noexpandtab
	au FileType python set tabstop=4 shiftwidth=4 noexpandtab
	au FileType markdown set tabstop=4 shiftwidth=4 conceallevel=2
	au FileType typescriptreact,typescript,javascript,javascriptreact,lua set tabstop=2 shiftwidth=2
	au FileType vim set fdm=marker
	au TextYankPost * silent! lua require'vim.highlight'.on_yank({ timeout=500 })

	autocmd Filetype help nmap <silent><buffer> q :q<CR>
	autocmd Filetype help wincmd K
	autocmd FileType tex nnoremap <F5> :silent VimtexCompile<CR>
	autocmd FileType tex inoremap <F5> <esc>:silent VimtexCompile<CR>
	augroup CompletionTriggerCharacter
	autocmd!
	autocmd BufEnter * let g:completion_trigger_character = ['.']
	autocmd BufEnter *.c,*.cpp let g:completion_trigger_character = ['.', '::']
	augroup end
	autocmd FileType markdown set foldexpr=NestedMarkdownFolds()

	autocmd Filetype c,cpp nnoremap <leader><C-s> m`:w!<cr>:%!clang-format %<cr>:w<cr>``

	cabbrev W w
	cabbrev E e
	cabbrev Wq wq
	]], '')

local map = require('_utils').map

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
map('n','<leader>da','gg0VGd',{})
--openvimrc
map('n','<leader>vi',':tabe ~/.config/nvim/lua/init.lua<cr>',{})
--sourcevimr
map('n','<leader>so',':source $MYVIMRC<cr>',{})

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
map('i','<Tab>',"pumvisible() ? \"\\<C-n>\" : \"\\<Tab>\"",{expr=true,noremap=true})
map('i','<S-Tab>',"pumvisible() ? \"\\<C-p>\" : \"\\<S-Tab>\"",{expr=true,noremap=true})
map('n','<leader>co',':silent !tmux send-keys -t 1 "./configure.sh" "C-m"<cr>',{})
map('n','<leader>cc',':silent !tmux send-keys -t 1 "./build.sh" "C-m"<cr>',{})
map('n','<leader>rr',':silent !tmux send-keys -t 1 "./run.sh" "C-m"<cr>',{})

g.tex_flavor = "latex"
g.vimtex_view_method = 'skim'

g.signify_disable_by_default=1

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
g.completion_sorting = "length"
g.completion_trigger_keyword_length = 3
g.completion_timer_cycle = 200
g.gruvbox_color_column="bg3"
g.vimtex_enabled=1
g.vimtex_fold_enabled=1
g.startify_bookmarks = {
	{ i='~/.config/nvim/lua/init.lua'},
	{ s='~/.config/nvim/lua/_snips.lua'},
	{ z='~/.zshrc' },
	{ p='~/Workshop/cpp/major_project/src/main.cpp' },
}
