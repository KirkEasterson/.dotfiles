return {
	"Zeioth/compiler.nvim",
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
