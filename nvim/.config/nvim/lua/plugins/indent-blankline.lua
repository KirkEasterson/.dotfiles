return {
	'lukas-reineke/indent-blankline.nvim',
	event = "VeryLazy",
	opts = {
		char = "▏",
		context_char = "▏",
		use_treesitter = true,
		show_current_context = true,
		max_indent_increase = 1,
		show_trailing_blankline_indent = false,
		filetype_exclude = {
			"help",
			"startify",
			"dashboard",
			"packer",
			"neogitstatus",
			"NvimTree",
			"Trouble",
			"Alpha",
		},
	},
}
