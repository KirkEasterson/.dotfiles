return {
	'ellisonleao/gruvbox.nvim',
	enabled = false,
	lazy = false,
	priority = 1000,
	config = function(_, opts)
		require('gruvbox').setup(opts)
		vim.cmd [[colorscheme gruvbox]]
	end,
	init = function()
		vim.o.background = "dark"
	end,
	opts = {
		underline = true,
		italic = {
			operators = true
		}
	},
}
