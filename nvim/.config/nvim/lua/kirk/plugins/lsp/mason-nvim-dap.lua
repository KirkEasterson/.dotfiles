return {
	"jay-babu/mason-nvim-dap.nvim",
	cond = not vim.g.started_by_firenvim,
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},
	event = "UIEnter",
	version = "v2.*",
	cmd = {
		"DapInstall",
		"DapUninstall",
	},
	opts = {
		automatic_installation = true,
		automatic_setup = true,
		ensure_installed = {
			"bash",
			"delve",
			"haskell",
			"javadbg",
			"js",
			"kotlin",
			"node2",
			"python",
		},
		handlers = {
			function(config)
				require("mason-nvim-dap").default_setup(config)
			end,
		},
	},
}
