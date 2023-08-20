return {
	'ruifm/gitlinker.nvim',
	cond = not vim.g.started_by_firenvim,
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	opts = {
		mappings = nil,
	},
}
