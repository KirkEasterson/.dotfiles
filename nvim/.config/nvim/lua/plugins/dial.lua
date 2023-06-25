return {
	'monaqa/dial.nvim',
	cmd = {
		"DialIncrement",
		"DialDecrement",
	},
	keys = {
		-- TODO: figure out why the lua calls didn't work
		{ "<C-a>", "<Cmd>DialIncrement<CR>", mode = { "n", "v" } },
		{ "<C-x>", "<Cmd>DialDecrement<CR>", mode = { "n", "v" } },
		{ "g<C-a>", "<Cmd>DialIncrement<CR>", mode = "v" },
		{ "g<C-a>", "<Cmd>DialDecrement<CR>", mode = "v" },
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
