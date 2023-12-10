return {
	'JoosepAlviste/nvim-ts-context-commentstring',
	opts = {
		enable_autocmd = false,
	},
	init = function()
		-- disable backward compatability for more speed
		vim.g.skip_ts_context_commentstring_module = true
	end,
}