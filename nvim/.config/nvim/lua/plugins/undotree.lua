return {
	"mbbill/undotree",
	cmd = {
		"UndotreeFocus",
		"UndotreeHide",
		"UndotreeShow",
		"UndotreeToggle",
	},
	keys = {
		{
			"<leader>ut",
			function()
				vim.cmd([[ UndotreeToggle ]])
			end,
			desc = "Undo tree",
		},
	},
}
