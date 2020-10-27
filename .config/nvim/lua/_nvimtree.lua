local M={}
local map = require('_utils').map

function M.setup()
  vim.g.lua_tree_side = 'left'
  vim.g.lua_tree_width = 30
  vim.g.lua_tree_ignore = { '.git', 'node_modules', '.cache' }
  vim.g.lua_tree_auto_open = 1
  vim.g.lua_tree_quit_on_open = 1
  vim.g.lua_tree_follow = 1
  vim.g.lua_tree_indent_markers = 1
  vim.g.lua_tree_hide_dotfiles = 1
  vim.g.lua_tree_git_hl = 1
  vim.g.lua_tree_show_icons = {
    git= 1,
    folders= 1,
    files= 1
  }
  vim.g.lua_tree_bindings = {
    edit=            {'<CR>', 'o'},
    edit_vsplit=     '<C-v>',
    edit_split=      '<C-h>',
    edit_tab=        '<C-t>',
    toggle_ignored=  'I',
    toggle_dotfiles= 'H',
    refresh=         'R',
    preview=         '<Tab>',
    cd=              '<C-]>',
    create=          'a',
    remove=          'd',
    rename=          'r',
    cut=             'x',
    copy=            'c',
    paste=           'p',
    prev_git_item=   '[c',
    next_git_item=   ']c',
  }

  vim.g.lua_tree_icons = {
    default= '',
    symlink= '',
    git= {
      unstaged= "✗",
      staged= "✓",
      unmerged= "",
      renamed= "➜",
      untracked= "★"
    },
    folder= {
      default= "",
      open= ""
    }
  }

  vim.api.nvim_exec([[
  augroup LuaTreeOverride
  au!
  au FileType LuaTree setlocal nowrap
  augroup END
  ]], '')
  map('n','<leader>o',':LuaTreeToggle<cr>',{noremap=true})
  map('n','<leader>r',':LuaTreeRefresh<cr>',{noremap=true})
  map('n','<leader>n',':LuaTreeFindFile<CR>',{noremap=true})
end

return M
