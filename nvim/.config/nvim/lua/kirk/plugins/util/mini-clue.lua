return {
	'echasnovski/mini.clue',
	enabled = false,
	cond = not vim.g.started_by_firenvim,
	event = "VimEnter",
	version = "*",
	opts = {
		window = {
			config = {
				border = "rounded",
			},
		},
	},
}
