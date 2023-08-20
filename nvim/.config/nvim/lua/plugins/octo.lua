return {
	'pwntester/octo.nvim',
	cond = not vim.g.started_by_firenvim,
	cmd = "Octo",
	dependencies = {
		'nvim-lua/plenary.nvim',
		-- 'nvim-telescope/telescope.nvim',
		'nvim-tree/nvim-web-devicons',
	},
	opts = {},
}
