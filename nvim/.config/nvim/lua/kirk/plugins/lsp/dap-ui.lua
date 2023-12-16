return {
	"rcarriga/nvim-dap-ui",
	cond = not vim.g.started_by_firenvim,
	dependencies = {
		"mfussenegger/nvim-dap",
		"jay-babu/mason-nvim-dap.nvim",
		"theHamsta/nvim-dap-virtual-text",
	},
	version = "v3.*",
	keys = {
		{
			"<leader>do",
			function()
				require("dapui").toggle()
			end,
			desc = "Toggle debug UI",
		},
	},
	opts = {},
	config = function(_, opts)
		local dap, dapui = require("dap"), require("dapui")

		dapui.setup(opts)

		-- automatically open and close dap-ui
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end,
}
