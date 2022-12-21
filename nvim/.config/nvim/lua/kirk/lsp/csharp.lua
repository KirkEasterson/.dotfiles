require('kirk.lsp.on_attach')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local csharp_on_attach = function(client, bufnr)
	client.server_capabilities.semanticTokensProvider = nil
	on_attach(client, bufnr)
end

local pid = vim.fn.getpid()
require('lspconfig').omnisharp.setup {
	on_attach = csharp_on_attach,
	capabilities = vim.lsp.protocol.make_client_capabilities(),
	cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(pid) },
	enable_import_completion = true,
	organize_imports_on_format = true,
}
