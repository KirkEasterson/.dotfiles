require('kirk.lsp.on_attach')
lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local ts_on_attach = function(client, bufnr)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.document_range_formatting = false

	local ts_utils = require("nvim-lsp-ts-utils")
	ts_utils.setup({})
	ts_utils.setup_client(client)
	on_attach(client, bufnr)
end

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

