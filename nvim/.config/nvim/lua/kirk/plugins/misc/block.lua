return {
	"HampusHauffman/block.nvim",
	enabled = false,
	cond = not vim.g.started_by_firenvim,
	cmd = {
		"Block",
		"BlockOff",
		"BlockOn",
	},
	keys = {
		{
			"<leader>bb",
			vim.cmd.Block,
			desc = "Toggle blocks",
		},
	},
	opts = {},
}
