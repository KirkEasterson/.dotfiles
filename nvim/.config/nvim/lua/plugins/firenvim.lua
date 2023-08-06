return {
	"glacambre/firenvim",
	lazy = false,
	cond = not not vim.g.started_by_firenvim,
	version = "0.2.*",
	build = function()
		require("lazy").load({ plugins = "firenvim", wait = true, })
		vim.fn["firenvim#install"](0)
	end,
	config = function(_, _)
		vim.o.laststatus = 0
		vim.opt.confirm = false
	end,
}
