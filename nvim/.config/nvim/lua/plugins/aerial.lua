return {
	'stevearc/aerial.nvim',
	enabled = false,
	keys = {
		{
			'<leader><leader>o',
			'<Cmd>AerialToggle!<CR>',
			desc = "Toggle Aerial"
		},
	},
	opts = {
		backends = {
			"lsp",
			"treesitter",
			"markdown",
			"man",
		},
		layout = {
			min_width = 20,
			max_width = { 40, 0.3 },
			default_direction = "right",
		},
		keymaps = {
			["<C-j>"] = false,
			["<C-k>"] = false,
		},
		filter_kind = false, -- false shows all symbols
		highlight_on_hover = true,
		show_guides = true,
	},
}
