return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-neotest/neotest-go",
		"nvim-neotest/neotest-python",
		'Issafalcon/neotest-dotnet',
	},
	keys = {
		{ "<leader>Tr",
			function()
				require("neotest").run.run()
			end
		},
		{ "<leader>Ts",
			function()
				require("neotest").run.stop()
			end
		},
		{ "<leader>Ta",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end
		},
		{ "<leader>Td",
			function()
				require("neotest").run.run({ strategy = "dap" })
			end
		},
	},
	config = {
		adapters = {
			-- require("neotest-go"),
			-- require("neotest-dotnet"),
			-- require("neotest-python"),
		},
	},
}
