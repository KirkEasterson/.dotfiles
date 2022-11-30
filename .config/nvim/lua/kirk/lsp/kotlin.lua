require('kirk.lsp.on_attach')
local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()

lspconfig.kotlin_language_server.setup {
	cmd = { "kotlin-language-server" },
	filetypes = { "kotlin" },
	capabilities = capabilities,
	on_attach = on_attach,
}
