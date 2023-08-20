return {
	"Zeioth/compiler.nvim",
	cond = not vim.g.started_by_firenvim,
	dependencies = {
		"stevearc/overseer.nvim"
	},
	cmd = {
		"CompilerOpen",
		"CompilerToggleResults",
		"CompilerRedo",
	},
	keys = {
		{
			'<leader>co',
			'<Cmd>CompilerOpen<CR>',
			desc = "View TODOs",
		},
	},
	opts = {

	},
}
