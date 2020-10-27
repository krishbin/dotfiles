local M={}
local nvim_lsp = require'nvim_lsp'

local function on_attach(client)
  require'completion'.on_attach(client)
  require'diagnostic'.on_attach(client)

	local map = require('_utils').map
  map('i', '<c-space>',  'completion#trigger_completion()')
  map('n', 'K',          '<cmd>lua require"lsp".show_doc()<CR>')
  map('n', '<leader>k',      '<cmd>lua require"lsp".hover()<CR>')

  map('n', 'gr',         '<cmd>lua vim.lsp.buf.references()<CR>')
  map('n', 'gd',         '<cmd>lua vim.lsp.buf.definition()<CR>')
  map('n', 'gy',         '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')

  map('n', '<leader>s',  '<cmd>lua require"lsp_cbs.diagnostics".prev()<CR>')
  map('n', '<leader>d',  '<cmd>lua require"lsp_cbs.diagnostics".next()<CR>')
end

local lang_servers = {
	{lsp_name = "clangd"},
	{lsp_name = "texlab"},
	{lsp_name = "jedi_language_server"},
	{lsp_name = "sumneko_lua"},
	{lsp_name = "tsserver"},
}

function M.setup()
	for _,lsp_config in pairs(lang_servers)
	do
	nvim_lsp[lsp_config.lsp_name].setup{on_attach=on_attach}
	end
end

return M
