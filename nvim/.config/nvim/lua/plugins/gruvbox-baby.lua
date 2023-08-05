return {
	"luisiacc/gruvbox-baby",
	-- enabled = false,
	lazy = false,
	priority = 1000,
	config = function(_, _)
		vim.cmd [[colorscheme gruvbox-baby]]
	end,
	init = function()
		vim.o.background = "dark"

		vim.g.gruvbox_baby_telescope_theme = 1
		vim.g.gruvbox_baby_telescope_theme = 0
	end,
}
