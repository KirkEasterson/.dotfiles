return {
	"nvim-neotest/neotest",
	cond = not vim.g.started_by_firenvim,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-neotest/neotest-go",
		"nvim-neotest/neotest-python",
		'Issafalcon/neotest-dotnet',
	},
	keys = {
		{
			"<leader>Tr",
			function()
				require("neotest").run.run()
			end,
			desc = "Run test",
		},
		{
			"<leader>Ts",
			function()
				require("neotest").run.stop()
			end,
			desc = "Stop test",
		},
		{
			"<leader>Ta",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "Run test",
		},
		{
			"<leader>Td",
			function()
				require("neotest").run.run({ strategy = "dap" })
			end,
			desc = "Debug test",
		},
	},
	opts = {
		adapters = {
			-- require("neotest-go"),
			-- require("neotest-dotnet"),
			-- require("neotest-python"),
		},
	},
}
