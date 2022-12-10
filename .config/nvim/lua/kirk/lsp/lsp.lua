require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	}
})

require("mason-lspconfig").setup({
	automatic_installation = true,
	ensure_installed = {
		"bashls",
		"clangd",
		"cssmodules_ls",
		"dockerls",
		"eslint",
		"gopls",
		"html",
		"jsonls",
		"kotlin_language_server",
		"pyright",
		"rust_analyzer",
		"sumneko_lua",
		"texlab",
		"tsserver",
		"vimls",
	},
})

-- require('kirk.lsp.dap')
-- require('kirk.lsp.nlua')
-- require('kirk.lsp.rust')
-- require('kirk.lsp.ts')
require('kirk.lsp.go')
require('kirk.lsp.py')
require('kirk.lsp.tex')
require('kirk.lsp.kotlin')
require('kirk.lsp.csharp')
require('kirk.lsp.fsharp')

local signs = {
	Error = " ",
	Warn = " ",
	Hint = " ",
	Info = " ",
}
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	vim.cmd("highlight DiagnosticSign" .. type .. " guibg=none")
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false,
})
