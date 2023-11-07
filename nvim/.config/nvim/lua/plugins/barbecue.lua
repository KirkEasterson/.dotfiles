return {
	"utilyre/barbecue.nvim",
	-- enabled = false,
	cond = not vim.g.started_by_firenvim,
	version = "v1.*",
	dependencies = {
		"neovim/nvim-lspconfig",
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons",
	},
	event = 'BufAdd',
	cmd = "Barbecue",
	opts = {
		attach_navic = false,
		show_navic = false,
		symbols = {
			separator = "",
		},
		exclude_filetypes = {
			"DiffviewFiles",
			"NvimTree",
			"Trouble",
			"alpha",
			"dashboard",
			"help",
			"neogitstatus",
			"netrw",
			"packer",
			"startify",
			"toggleterm",
		},
	},
}
