require('kirk.lsp.on_attach')
lspconfig = require('lspconfig')

lspconfig.tsserver.setup({
	on_attach = on_attach,
})
