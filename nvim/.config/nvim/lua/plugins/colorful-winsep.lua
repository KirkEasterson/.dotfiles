return {
	"nvim-zh/colorful-winsep.nvim",
	cond = not vim.g.started_by_firenvim,
	event = "VeryLazy",
	opts = {
		interval = 30,
		no_exec_files = {
			"packer",
			"TelescopePrompt",
			"mason",
			"Lazy",
			"CompetiTest",
			-- "NvimTree",
		},
	},
}
