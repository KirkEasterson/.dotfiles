return {
	'windwp/nvim-autopairs',
	event = "InsertEnter",
	opts = {
		check_ts = true,
		enable_check_bracket_line = false,
		ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
	},
	init = function ()
		local autopairs = require("nvim-autopairs")
		local rule = require('nvim-autopairs.rule')
		local ts_conds = require('nvim-autopairs.ts-conds')

		autopairs.add_rules({
			rule("%", "%", "lua")
				:with_pair(ts_conds.is_ts_node({ 'string', 'comment' })),
			rule("$", "$", "lua")
				:with_pair(ts_conds.is_not_ts_node({ 'function' }))
		})
	end,
}
