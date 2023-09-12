return {
	'ellisonleao/gruvbox.nvim',
	lazy = false,
	priority = 1000,
	-- config = function(_, opts)
	-- 	require('gruvbox').setup(opts)
	-- 	vim.cmd [[colorscheme gruvbox]]
	-- 	vim.cmd("highlight WinSeparator guibg=None guifg=" .. require('gruvbox.palette').get_base_colors().gray)
	-- end,
	opts = {
		underline = true,
		italic = {
			operators = true
		}
	},
}
