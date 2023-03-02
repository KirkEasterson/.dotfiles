return {
	"smjonas/inc-rename.nvim",
	enabled = false,
	keys = {
		{
			"<leader>rn",
			function()
				return ":IncRename " .. vim.fn.expand("<cword>")
			end
		},
	},
	config = true,
}
