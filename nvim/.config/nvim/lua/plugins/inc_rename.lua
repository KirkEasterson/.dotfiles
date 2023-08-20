return {
	"smjonas/inc-rename.nvim",
	cond = not vim.g.started_by_firenvim,
	enabled = false, -- replaced by lspsaga
	cmd = "IncRename",
	keys = {
		{
			"<leader>rn",
			function()
				return ":IncRename " .. vim.fn.expand("<cword>")
			end,
			expr = true,
			desc = "Rename"
		},
	},
	opts = {},
}
