return {
	'romgrk/barbar.nvim',
	cond = not vim.g.started_by_firenvim,
	enabled = false,
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
	opts = {
		animation = false,
		auto_hide = true,
		tabpages = false,
		maximum_padding = 1,
		minimum_padding = 1,
	},
}
