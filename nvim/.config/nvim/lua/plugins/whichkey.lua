return {
	"folke/which-key.nvim",
	cond = not vim.g.started_by_firenvim,
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {}
}
