return {
	"jay-babu/mason-nvim-dap.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},
	cmd = {
		"DapInstall",
		"DapUninstall",
	},
	opts = {
		automatic_installation = true,
		automatic_setup = true,
		ensure_installed = {
			"delve",
			"python",
			"node2",
			"js",
			"bash",
		},
	},
	config = function(_, opts)
		require('mason-nvim-dap').setup(opts)
		require('mason-nvim-dap').setup_handlers()
	end
}
