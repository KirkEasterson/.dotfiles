return {
	'simrat39/rust-tools.nvim',
	event = 'FileType *.rs',
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	opts = {
		server = {
			on_attach = require('lsp.on_attach').on_attach,
		}
	},
}
