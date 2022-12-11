require('kirk.lsp.on_attach')

local pid = vim.fn.getpid()
require('lspconfig').omnisharp.setup {
	on_attach = on_attach,
	capabilities = vim.lsp.protocol.make_client_capabilities(),
	cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(pid) },
	enable_import_completion = true,
	organize_imports_on_format = true,
}
