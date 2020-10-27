local M={}

function M.setup()
local map = require('_utils').map
local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    shorten_path = true, -- currently the default value is true
    mappings = {
      i = {
        ["<c-x>"] = false,
        ["<c-h>"] = actions.goto_file_selection_split,
        ["<c-o>"] = actions.goto_file_selection_tabedit,
        ["<c-q>"] = actions.close,
      },
    },
  }
}

map('n','<leader>gr',":lua require('telescope.builtin').lsp_references{ shorten_path = true }<CR>",{noremap=true,silent=true})
map('n','<leader>tl',":lua require('telescope.builtin').live_grep()<cr>",{noremap=true,silent=true})
map('n','<leader>tq',":lua require('telescope.builtin').quickfix()<cr>",{noremap=true,silent=true})
map('i','<c-n>','<Plug>(completion_trigger)',{noremap=true,silent=true})
map('n','<c-p>',":lua require('telescope.builtin').git_files{}<CR>",{noremap=true,silent=true})
map('n','<leader><c-p>',":lua require('telescope.builtin').find_files()<CR>",{noremap=true,silent=true})
map('n',',<c-p>',":lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ winblend = 20 }))<CR>",{noremap=true,silent=true})
map("n", "<Leader>tt", ":lua require('telescope.builtin').treesitter{}<CR>", {silent = true})
map("n", "<Leader>bb", ":lua require('telescope.builtin').buffers{}<CR>", {silent = true})
map("n", "<Leader>tq", ":lua require('telescope.builtin').quickfix{}<CR>", {silent = true})
end

return M
