return {
	"echasnovski/mini.bufremove",
	cond = not vim.g.started_by_firenvim,
	-- enabled = false, -- TODO: replace with a simple binding
	version = "*",
	keys = {
		{
			"<C-w>",
			function()
				require("mini.bufremove").delete()
			end,
			desc = "Generate docs",
		},
	},
	opts = {},
}
