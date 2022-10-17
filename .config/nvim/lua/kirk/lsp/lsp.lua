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
