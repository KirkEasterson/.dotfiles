require("aerial").setup({
	backends = { "lsp", "treesitter", "markdown", "man" },
	layout = {
		min_width = 20,
		default_direction = "right",
	},
	keymaps = {
		["<C-j>"] = false,
		["<C-k>"] = false,
	},
	filter_kind = false, -- false shows all symbols
	highlight_on_hover = true,
	show_guides = true,
})
