return {
	'lewis6991/gitsigns.nvim',
	event = 'VeryLazy',
	config = function()
		require('gitsigns').setup({
			current_line_blame      = true,
			signs                   = {
				add          = { text = "▌" },
				change       = { text = "▌" },
				topdelete    = { text = "▔" },
				delete       = { text = "▁" },
				changedelete = { text = "▁" },
				untracked    = { text = "▌" }
			},
			current_line_blame_opts = {
				delay = 10,
			},
		})

		vim.cmd([[highlight SignColumn guibg=none]])
		vim.cmd([[highlight GitSignsAdd guibg=none]])
		vim.cmd([[highlight GitSignsChange guibg=none]])
		vim.cmd([[highlight GitSignsDelete guibg=none]])
	end,
}
