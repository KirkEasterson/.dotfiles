return {
	'lukas-reineke/indent-blankline.nvim',
	event = "VeryLazy",
	config = {
		use_treesitter = true,
		show_current_context = true,
		show_current_context_start = true,
		max_indent_increase = 1,
		show_trailing_blankline_indent = false,
	},
}
