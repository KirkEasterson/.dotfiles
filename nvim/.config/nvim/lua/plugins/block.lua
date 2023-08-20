return {
	"HampusHauffman/block.nvim",
	cond = not vim.g.started_by_firenvim,
	cmd = {
		"Block",
		"BlockOff",
		"BlockOn",
	},
	keys = {
		{
			"<leader>bb",
			"<Cmd>Block<CR>",
			desc = "Toggle blocks",
		},
	},
	opts = {},
}
