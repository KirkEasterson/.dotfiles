require('kirk.lsp.on_attach')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local py_on_attach = function(client, bufnr)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.document_range_formatting = false
	on_attach(client, bufnr)
end

-- https://github.com/microsoft/pyright
require('lspconfig').pyright.setup {
	capabilities = capabilities,
	on_attach = py_on_attach,
}

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.pylint,
		-- null_ls.builtins.code_actions.pyright, -- TODO: find code_actions for python
		null_ls.builtins.formatting.autopep8
	},
	on_attach = on_attach,
})
