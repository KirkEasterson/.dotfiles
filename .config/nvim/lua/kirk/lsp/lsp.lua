require('kirk.lsp.inc_rename')
require('kirk.lsp.completion')
-- require('kirk.lsp.dap')
require('kirk.lsp.go')
require('kirk.lsp.nlua')
require('kirk.lsp.py')
require('kirk.lsp.rust')
require('kirk.lsp.tex')
require('kirk.lsp.ts')
require('kirk.lsp.semantic_tokens')

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	vim.cmd("highlight DiagnosticSign" .. type .. " guibg=none")
end
