return {
	'theHamsta/nvim-dap-virtual-text',
	cond = not vim.g.started_by_firenvim,
	opts = {
		commented = true,
		only_first_definition = false,
		all_references = true,
	},
}
