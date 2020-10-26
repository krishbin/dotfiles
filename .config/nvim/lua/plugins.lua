vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	use {'wbthomason/packer.nvim', opt = true}

	use 'bronson/vim-trailing-whitespace'
	use {
		'itchyny/lightline.vim',
		config = function()

		end}
		use 'tpope/vim-surround'
		use 'tpope/vim-commentary'
		use 'tpope/vim-fugitive'

		use {
			'pangloss/vim-javascript',
			ft = {'js'}
		}

		use {
			'posva/vim-vue',
			ft = {'html','vue'}
		}

		use {'morhetz/gruvbox',
		config = function() vim.cmd "colorscheme gruvbox" end
	}

	use {
		'neovim/nvim-lspconfig',
		'nvim-lua/completion-nvim',
		'nvim-lua/diagnostic-nvim'
	}

	use {'nvim-lua/popup.nvim'}
	use {'nvim-lua/plenary.nvim'}
	use {'nvim-lua/telescope.nvim'}
	use {'kyazdani42/nvim-web-devicons'}

	use {
		'kyazdani42/nvim-tree.lua',
		config = function()
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
		end
	}

	use {'nvim-treesitter/nvim-treesitter'}

	use {'dart-lang/dart-vim-plugin',
	ft = {'dart'}
}

use {'lervag/vimtex',
ft = {'tex'}
			}

		end)
