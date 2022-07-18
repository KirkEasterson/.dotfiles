require('kirk.lsp.on_attach')
lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.tsserver.setup({
	on_attach = ts_on_attach,
	capabilities = capabilities,
})

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.code_actions.eslint,
		null_ls.builtins.formatting.prettier
	},
	on_attach = on_attach
})

-- TODO: debug why this isn't working
require('nvim-ts-autotag').setup()
