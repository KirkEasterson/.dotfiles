require('kirk.lsp.on_attach')

require('lspconfig').omnisharp.setup {
	on_attach = on_attach,
	capabilities = vim.lsp.protocol.make_client_capabilities(),
	cmd = { "dotnet", "$HOME/.local/share/nvim/mason/packages/omnisharp/OmniSharp.dll" },
	enable_import_completion = true,
	organize_imports_on_format = true,
}
