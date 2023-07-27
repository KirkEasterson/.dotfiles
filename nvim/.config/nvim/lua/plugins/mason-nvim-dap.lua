return {
	"jay-babu/mason-nvim-dap.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},
	version = "v2.1.*",
	event = "VeryLazy",
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
				require('mason-nvim-dap').default_setup(config)
			end,
			python = function(config)
				config.adapters = {
					type = "executable",
					command = "/usr/bin/python3",
					args = {
						"-m",
						"debugpy.adapter",
					},
				}
				require('mason-nvim-dap').default_setup(config) -- don't forget this!
			end,
		},
	},
}
