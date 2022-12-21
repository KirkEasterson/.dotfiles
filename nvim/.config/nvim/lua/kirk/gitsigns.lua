require('gitsigns').setup({
	current_line_blame = true,
})

vim.cmd([[highlight SignColumn guibg=none]])
vim.cmd([[highlight GitSignsAdd guibg=none]])
vim.cmd([[highlight GitSignsChange guibg=none]])
vim.cmd([[highlight GitSignsDelete guibg=none]])
