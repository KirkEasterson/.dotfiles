return {
	'sindrets/diffview.nvim',
	cond = not vim.g.started_by_firenvim,
	-- enabled = false,
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	cmd = {
		'DiffviewClose',
		'DiffviewFileHistory',
		'DiffviewFocusFiles',
		'DiffviewOpen',
		'DiffviewRefresh',
		'DiffviewToggleFiles',
	},
	opts = {},
}
