local M={}
local nvim_lsp = require'nvim_lsp'

local function on_attach(client)
  require'completion'.on_attach(client)
  require'diagnostic'.on_attach(client)

	local map = require('_utils').map
  map('i', '<c-space>',  'completion#trigger_completion()')
  -- map('n', 'K',          '<cmd>lua .show_doc()<CR>')
  map('n', 'gr',         '<cmd>lua vim.lsp.buf.references()<CR>')
  map('n', 'gd',         '<cmd>lua vim.lsp.buf.definition()<CR>')
  map('n', 'gy',         '<cmd>lua vim.lsp.buf.type_definition()<CR>')

	if client.resolved_capabilities['document_highlight'] then
  vim.cmd("autocmd CursorHold <buffer> lua vim.lsp.util.show_line_diagnostics()")
	vim.cmd("autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()")
	vim.cmd("autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()")
	vim.cmd("autocmd CursorMoved <buffer> lua vim.lsp.util.buf_clear_references()")
	end

end

local lang_servers = {
	{lsp_name = "clangd"},
	{lsp_name = "texlab"},
	{lsp_name = "jedi_language_server"},
	{lsp_name = "sumneko_lua"},
	{lsp_name = "tsserver"},
	{lsp_name = "cmake"},
}

function M.setup()
	for _,lsp_config in pairs(lang_servers)
	do
	nvim_lsp[lsp_config.lsp_name].setup{on_attach=on_attach}
	end
end

return M
