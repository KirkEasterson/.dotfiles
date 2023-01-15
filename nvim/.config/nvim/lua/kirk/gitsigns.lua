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

-- TODO: use lua to update the highlight group instead of set it
-- vim.api.nvim_set_hl(0, 'SignColumn', { bg = nil })
-- vim.api.nvim_set_hl(0, 'GitSignsAdd', { bg = nil })
-- vim.api.nvim_set_hl(0, 'GitSignsChange', { bg = nil })
-- vim.api.nvim_set_hl(0, 'GitSignsDelete', { bg = nil })
