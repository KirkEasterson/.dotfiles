return {
	'ellisonleao/gruvbox.nvim',
	lazy = false,
	priority = 1000,
	-- config = function(_, opts)
	-- 	require('gruvbox').setup(opts)
	-- 	vim.cmd [[colorscheme gruvbox]]
	-- end,
	opts = {
		underline = true,
		italic = {
			operators = true
		}
	},
}
