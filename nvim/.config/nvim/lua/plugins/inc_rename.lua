return {
	"smjonas/inc-rename.nvim",
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
