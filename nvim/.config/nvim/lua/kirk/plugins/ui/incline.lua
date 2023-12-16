return {
	"b0o/incline.nvim",
	enabled = false,
	cond = not vim.g.started_by_firenvim,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"ellisonleao/gruvbox.nvim",
	},
	event = {
		"BufNewFile",
		"BufReadPre",
	},
	opts = {
		window = {
			margin = {
				vertical = 0,
				horizontal = 1,
			},
		},
		hide = {
			cursorline = true,
			only_win = true,
		},
		render = function(props)
			local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
			local icon, color = require("nvim-web-devicons").get_icon_color(filename)
			return {
				{
					icon,
					guifg = color,
				},
				{
					" ",
				},
				{
					filename,
				},
			}
		end,
		highlight = {
			groups = {
				InclineNormal = {
					guibg = require("gruvbox").palette.faded_orange,
				},
				InclineNormalNC = {
					guibg = require("gruvbox").palette.faded_blue,
				},
			},
		},
	},
}
