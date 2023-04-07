function next_paragraph_line_count(search_direction)
	local current_line = vim.api.nvim_win_get_cursor(0)[1]
	local next_paragraph = vim.fn.search("\\(^$\\)\\(\\n^$\\)\\@!", search_direction)
	local distance_to_scroll = next_paragraph - current_line
	return distance_to_scroll
end

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
		{ "{" },
		{ "}" },
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
	config = function(_, opts)
		require('neoscroll.config').set_mappings({
			['{'] = { 'scroll', { 'next_paragraph_line_count("b")', 'false', '50' } },
			['}'] = { 'scroll', { 'next_paragraph_line_count("n")', 'false', '50' } },
		})
		require('neoscroll').setup(opts)

	end
}
