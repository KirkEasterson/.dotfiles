return {
	-- "luisiacc/gruvbox-baby",
	'ellisonleao/gruvbox.nvim',
	lazy = false,
	priority = 1000,
	config = function(_, opts)
		-- use these options for 'luisiacc' gruvbox
		-- vim.cmd [[colorscheme gruvbox-baby]]

		-- use these options for 'ellisonleao' gruvbox
		require('gruvbox').setup(opts)
		vim.o.background = "dark"
		vim.cmd [[colorscheme gruvbox]]
	end,
	opts = {
		underline = true,
	},
}
