return {
	'JoosepAlviste/nvim-ts-context-commentstring',
	opts = {},
	init = function()
		vim.g.skip_ts_context_commentstring_module = true
	end,
}
