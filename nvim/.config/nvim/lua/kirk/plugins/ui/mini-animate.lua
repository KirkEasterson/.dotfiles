return {
	'echasnovski/mini.animate',
	cond = not vim.g.started_by_firenvim,
	enabled = false,
	event = "BufEnter",
	version = '*',
	opts = {
		cursor = {
			enable = false,
		},
		scroll = {
			enable = true,
		},
		resize = {
			enable = false,
		},
		open = {
			enable = false,
		},
		close = {
			enable = false,
		},
	},
}
