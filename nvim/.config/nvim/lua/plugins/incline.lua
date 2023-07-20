return {
	"b0o/incline.nvim",
	enabled = false,
	dependencies = {
		'ellisonleao/gruvbox.nvim',
		'nvim-tree/nvim-web-devicons',
	},
	event = "VeryLazy",
	opts = {
		highlight = {
			groups = {
				InclineNormal = { guibg = require('gruvbox.palette').colors.dark2 },
				InclineNormalNC = { guibg = require('gruvbox.palette').colors.dark1 },
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
