vim.cmd [[packadd! nvim-lspconfig]]
vim.cmd [[packadd! nvim-treesitter]]
vim.cmd [[packadd! nvim-web-devicons]]
vim.cmd [[packadd! telescope.nvim]]
vim.cmd [[packadd! plenary.nvim]]

local on_attach_vim = function(client)
  require'completion'.on_attach(client)
  require'diagnostic'.on_attach(client)
end

require'nvim_lsp'.clangd.setup{on_attach=on_attach_vim}

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,              -- false will disable the whole extension
    use_languagetree = false,
  },
  indent = {
    enable = true
  }
}

require'nvim-web-devicons'.setup {
 default = true;
}

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
