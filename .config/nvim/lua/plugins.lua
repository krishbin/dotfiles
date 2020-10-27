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
	use {'kyazdani42/nvim-web-devicons',
	config=function()
		require'nvim-web-devicons'.setup {
			default = true;
		}
	end
}

use {
	'kyazdani42/nvim-tree.lua',
}

use {'nvim-treesitter/nvim-treesitter'}

use {'dart-lang/dart-vim-plugin',
ft = {'dart'}
}

use {'lervag/vimtex',
ft = {'tex'}
			}

		end)
