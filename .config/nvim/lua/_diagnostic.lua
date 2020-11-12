local M = {}

function M.setup()
	local map = require('_utils').map
	local sign_define = vim.fn.sign_define
	local command = vim.cmd

	require'nvim-treesitter.configs'.setup {
		highlight = {
			enable = true,              -- false will disable the whole extension
			use_languagetree = false,
		},
		incremental_selection = {
			enable = true,
			keymaps = { -- mappings for incremental selection (visual mappings)
			init_selection = '<M-w>',    -- maps in normal mode to init the node/scope selection
			node_incremental = '<M-w>',  -- increment to the upper named parent
			scope_incremental = '<M-e>', -- increment to the upper scope (as defined in locals.scm)
			node_decremental = '<M-C-w>',  -- decrement to the previous node
		}
	},
	indent = { enable = true },
	refactor = {
		highlight_definitions = { enable = true },
		highlight_current_scope = { enable = true },
	}
}

sign_define(
"LspDiagnosticsErrorSign",
{text = "❌", texthl = "LspDiagnosticsError"}
)
sign_define(
"LspDiagnosticsWarningSign",
{text = "", texthl = "LspDiagnosticsWarning"}
)
sign_define(
"LspDiagnosticsInformationSign",
{text = "", texthl = "LspDiagnosticsInformation"}
)
sign_define(
"LspDiagnosticsHintSign",
{text = "➤", texthl = "LspDiagnosticsHint"}
)

vim.g.space_before_virtual_text = 10
vim.g.diagnostic_trimmed_virtual_text = "60"
vim.g.diagnostic_enable_virtual_text = 1
vim.g.diagnostic_insert_delay = 1

map('n','<leader>]d',':NextDiagnosticCycle<CR>',{noremap=true,silent=true})
map('n','<leader>[d',':PrevDiagnosticCycle<CR>',{noremap=true,silent=true})
map('n','<leader>do',':OpenDiagnostic<CR>',{noremap=true,silent=true})

end

return M
