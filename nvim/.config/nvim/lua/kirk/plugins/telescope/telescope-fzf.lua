return {
	'nvim-telescope/telescope-fzf-native.nvim',
	cond = not vim.g.started_by_firenvim,
	build = 'make',
}
