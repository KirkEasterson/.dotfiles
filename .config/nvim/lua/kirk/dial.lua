vim.api.nvim_set_keymap("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
vim.api.nvim_set_keymap("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
vim.api.nvim_set_keymap("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
vim.api.nvim_set_keymap("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })
vim.api.nvim_set_keymap("v", "g<C-a>", require("dial.map").inc_gvisual(), { noremap = true })
vim.api.nvim_set_keymap("v", "g<C-x>", require("dial.map").dec_gvisual(), { noremap = true })

local augend = require("dial.augend")
require("dial.config").augends:register_group {
	default = {
		augend.integer.alias.decimal_int,
		augend.constant.alias.bool,
		augend.date.alias["%Y/%m/%d"],
		augend.date.alias["%Y-%m-%d"],
		augend.date.alias["%d/%m/%Y"],
		augend.date.alias["%d-%m-%Y"],
		augend.date.alias["%m/%d/%Y"],
		augend.date.alias["%m-%d-%Y"],
		augend.date.alias["%H:%M:%S"],
		augend.date.alias["%H:%M"],
		augend.constant.new {
			elements = { "&&", "||" },
			word = false,
			cyclic = true,
		},
		augend.constant.new {
			elements = { "and", "or" },
			word = true,
			cyclic = true,
		},
	},
}
