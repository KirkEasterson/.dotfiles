return {
	"jay-babu/mason-nvim-dap.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},
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
	},
	config = function(_, opts)
		require('mason-nvim-dap').setup(opts)
		require('mason-nvim-dap').setup_handlers()
	end
}
