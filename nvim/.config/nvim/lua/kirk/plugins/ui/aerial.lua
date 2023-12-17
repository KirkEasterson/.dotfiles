return {
	"stevearc/aerial.nvim",
	cond = not vim.g.started_by_firenvim,
	enabled = false,
	keys = {
		{
			"<leader><leader>o",
			"<Cmd>AerialToggle!<CR>",
			desc = "Toggle Aerial",
		},
	},
	cmd = {
		"AerialClose",
		"AerialCloseAll",
		"AerialInfo",
		"AerialNavClose",
		"AerialNavOpen",
		"AerialNavToggle",
		"AerialOpen",
		"AerialOpenAll",
		"AerialToggle",
	},
	opts = {
		backends = {
			"treesitter",
			"lsp",
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
