return {
	'neovim/nvim-lspconfig',
	event = 'VeryLazy',
	config = function()
		-- require('kirk.lsp.dap')
		-- require('kirk.lsp.nlua')
		-- require('kirk.lsp.rust')
		-- require('kirk.lsp.ts')
		require('kirk.lsp.csharp')
		require('kirk.lsp.fsharp')
		require('kirk.lsp.go')
		require('kirk.lsp.py')
		require('kirk.lsp.tex')
		require('kirk.lsp.kotlin')

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

		require('lspconfig.ui.windows').default_options.border = 'rounded'
	end,
}
