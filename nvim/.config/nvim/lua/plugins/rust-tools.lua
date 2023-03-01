return {
	'simrat39/rust-tools.nvim',
	event = 'BufEnter *.rs',
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
