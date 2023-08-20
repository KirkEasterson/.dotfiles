return {
	'm-demare/hlargs.nvim',
	cond = not vim.g.started_by_firenvim,
	enabled = false,
	event = 'BufEnter',
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
	},
	opts = {},
}
