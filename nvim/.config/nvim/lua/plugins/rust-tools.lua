return {
	'simrat39/rust-tools.nvim',
	cond = not vim.g.started_by_firenvim,
	ft = 'rust',
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	config = function()
		require('lsp.on_attach')
		require('rust-tools').setup({
			server = {
				on_attach = on_attach,
			}
		})
	end,
}
