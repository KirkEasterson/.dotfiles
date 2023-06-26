return {
	'luisiacc/gruvbox-baby',
	lazy = false,
	priority = 1000,
	config = function(_, opts)
		-- vim.g.gruvbox_baby_transparent_mode = true
		vim.g.gruvbox_baby_highlights = {
			["@text.strong"] = {
				fg = require('gruvbox-baby.colors').config(opts).soft_yellow,
				style = "bold",
			},
			["@text.emphasis"] = {
				fg = require('gruvbox-baby.colors').config(opts).soft_yellow,
				style = "italic",
			},
		}
		vim.cmd [[colorscheme gruvbox-baby]]
	end,
}
