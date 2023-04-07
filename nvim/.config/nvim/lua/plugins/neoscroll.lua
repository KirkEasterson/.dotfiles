return {
	'karb94/neoscroll.nvim',
	keys = {
		{ "<C-u>" },
		{ "<C-d>" },
		{ "<C-b>" },
		{ "<C-f>" },
		{ "<C-y>" },
		{ "<C-e>" },
		{ "zz" },
		{ "zt" },
		{ "zb" },
	},
	opts = {
		performance_mode = true,
		mappings = {
			"<C-u>",
			"<C-d>",
			"<C-b>",
			"<C-f>",
			"<C-y>",
			"<C-e>",
			"zz",
			"zt",
			"zb",
		},
		pre_hook = function()
			vim.opt.eventignore:append({
				'WinScrolled',
				'CursorMoved',
			})
		end,
		post_hook = function()
			vim.opt.eventignore:remove({
				'WinScrolled',
				'CursorMoved',
			})
			-- vim.fn.feedkeys("zz")
		end,
	},
}
