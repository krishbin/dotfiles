lua require 'init'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           vim-set                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"{{{
"""""""""""""""""""
"built into neovim"
"""""""""""""""""""
"lua <<EOF
"local on_attach_vim = function(client)
"  require'completion'.on_attach(client)
"  require'diagnostic'.on_attach(client)
"end
"
"require'nvim_lsp'.clangd.setup{on_attach=on_attach_vim}
"require'nvim_lsp'.texlab.setup{on_attach=on_attach_vim}
"require'nvim_lsp'.tsserver.setup{on_attach=on_attach_vim}
"
"require'nvim-treesitter.configs'.setup {
"  highlight = {
"    enable = true,              -- false will disable the whole extension
"    use_languagetree = false,
"  },
"  indent = {
"    enable = true
"  }
"}
"
"require'nvim-web-devicons'.setup {
" -- your personnal icons can go here (to override)
" -- DevIcon will be appended to `name`
" override = {
"  zsh = {
"    icon = "",
"    color = "#428850",
"    name = "Zsh"
"  }
" };
" -- globally enable default icons (default to false)
" -- will get overriden by `get_icons` option
" default = true;
"}
"
"local actions = require('telescope.actions')
"
"require('telescope').setup{
"  defaults = {
"    -- Example:
"    shorten_path = true, -- currently the default value is true
"    mappings = {
"      i = {
"        ["<c-x>"] = false,
"        ["<c-h>"] = actions.goto_file_selection_split,
"        ["<c-o>"] = actions.goto_file_selection_tabedit,
"        ["<c-q>"] = actions.close,
"      },
"    },
"  }
"}
"EOF


" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nnoremap <silent> <leader>dn :NextDiagnosticCycle<CR>
nnoremap <silent> <leader>dp :PrevDiagnosticCycle<CR>
nnoremap <silent> <leader>do :OpenDiagnostic<CR>

nnoremap <silent> <leader>gr <cmd>lua require'telescope.builtin'.lsp_references{ shorten_path = true }<CR>
nnoremap <silent> <leader>tl <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <silent> <leader>tq <cmd>lua require('telescope.builtin').quickfix()<cr>

imap <silent> <c-n> <Plug>(completion_trigger)
nnoremap <c-p> :lua require'telescope.builtin'.git_files{}<CR>
nnoremap <leader><c-p> <cmd>lua require'telescope.builtin'.find_files()<CR>
nnoremap ,<c-p> <cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ winblend = 20 }))<CR>


let g:completion_enable_snippet = 'UltiSnips'
let g:completion_sorting = "length"
let g:space_before_virtual_text = 10
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_insert_delay = 1

"call sign_define("LspDiagnosticsErrorSign", {"text" : "🔺", "texthl" : "LspDiagnosticsError"})
"call sign_define("LspDiagnosticsWarningSign", {"text" : "⚠️ ", "texthl" : "LspDiagnosticsWarning"})
"call sign_define("LspDiagnosticInformationSign", {"text" : "ℹ️", "texthl" : "LspDiagnosticsInformation"})
"call sign_define("LspDiagnosticHintSign", {"text" : "H", "texthl" : "LspDiagnosticsHint"})

let g:completion_trigger_keyword_length = 3
let g:completion_timer_cycle = 200

augroup CompletionTriggerCharacter
    autocmd!
    autocmd BufEnter * let g:completion_trigger_character = ['.']
    autocmd BufEnter *.c,*.cpp let g:completion_trigger_character = ['.', '::']
augroup end

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c



let g:gruvbox_color_column="bg3"
let g:vimtex_enabled=1
let g:vimtex_fold_enabled=1
let g:netrw_banner=0
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_browse_split=0
let g:netrw_winsize=15

"}}}
