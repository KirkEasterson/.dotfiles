vim.opt.list = true
vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("tab:⇥")
-- vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
	use_treesitter = true,
    show_current_context = true,
    show_current_context_start = true,
	max_indent_increase = 1,
	show_trailing_blankline_indent = false,
	context_patterns = true,
}
