return {
	'monaqa/dial.nvim',
	keys = {
		{ "<C-a>", function() require('dial.map').inc_normal() end },
		{ "<C-x>", function() require('dial.map').dec_normal() end },
		{ "<C-a>", function() require('dial.map').inc_visual() end, mode = "v" },
		{ "<C-x>", function() require('dial.map').dec_visual() end, mode = "v" },
		{ "g<C-a>", function() require('dial.map').inc_gvisual() end, mode = "v" },
		{ "g<C-a>", function() require('dial.map').inc_gvisual() end, mode = "v" },
	},
	config = function()
		local augend = require("dial.augend")
		require("dial.config").augends:register_group {
			default = {
				augend.integer.alias.decimal_int,
				augend.constant.alias.bool,
				augend.date.alias["%Y/%m/%d"],
				augend.date.alias["%Y-%m-%d"],
				augend.date.alias["%d/%m/%Y"],
				augend.date.alias["%d-%m-%Y"],
			},
		}
	end,
}
