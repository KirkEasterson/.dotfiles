return {
	'monaqa/dial.nvim',
	keys = {
		"<C-a>",
		"<C-x>",
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
