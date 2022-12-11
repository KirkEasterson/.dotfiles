require('kirk.lsp.on_attach')

require('lspconfig').fsautocomplete.setup {
	capabilities = vim.lsp.protocol.make_client_capabilities(),
	on_attach = on_attach,
	-- cmd = { 'dotnet', '$HOME/.local/share/nvim/mason/packages/fsautocomplete/fsautocomplete', '--background-service-enabled' },
	-- cmd = { 'fsautocomplete', '--background-service-enabled' },
	cmd = { 'fsautocomplete' },
}
