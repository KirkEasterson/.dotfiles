return {
	"b0o/incline.nvim",
	cond = not vim.g.started_by_firenvim,
	enabled = false,
	dependencies = {
		'ellisonleao/gruvbox.nvim',
		'nvim-tree/nvim-web-devicons',
	},
	event = "VeryLazy",
	opts = {
		highlight = {
			groups = {
				InclineNormal = { guibg = require('gruvbox.palette').get_base_colors().bg2 },
				InclineNormalNC = { guibg = require('gruvbox.palette').get_base_colors().bg1 },
			},
		},
		window = { margin = { vertical = 0, horizontal = 1 } },
		render = function(props)
			local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
			local icon, color = require("nvim-web-devicons").get_icon_color(filename)
			return { { icon, guifg = color }, { " " }, { filename } }
		end,
	},
}
