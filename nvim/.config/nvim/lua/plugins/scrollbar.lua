return {
	'petertriho/nvim-scrollbar',
	cond = not vim.g.started_by_firenvim,
	enabled = false,
	dependencies = {
		"lewis6991/gitsigns.nvim",
	},
	event = "VimEnter",
	opts = {
		hide_if_all_visible = true,
		handlers = {
			gitsigns = true,
		}
	},
}
