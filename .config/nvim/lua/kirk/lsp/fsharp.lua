require('kirk.lsp.on_attach')

require('lspconfig').fsautocomplete.setup {
	capabilities = vim.lsp.protocol.make_client_capabilities(),
	on_attach = on_attach,
}
