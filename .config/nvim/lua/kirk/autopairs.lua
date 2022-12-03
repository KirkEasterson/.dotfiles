local autopairs = require("nvim-autopairs")
local Rule = require('nvim-autopairs.rule')
local ts_conds = require('nvim-autopairs.ts-conds')

autopairs.setup({
	check_ts = true,
})

autopairs.add_rules({
	Rule("%", "%", "lua")
		:with_pair(ts_conds.is_ts_node({ 'string', 'comment' })),
	Rule("$", "$", "lua")
		:with_pair(ts_conds.is_not_ts_node({ 'function' }))
})
