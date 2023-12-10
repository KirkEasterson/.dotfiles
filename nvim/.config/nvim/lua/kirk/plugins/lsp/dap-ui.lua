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
	init = function()
		vim.cmd([[highlight	DapBreakpoint guifg=red]])
		vim.cmd([[highlight	DapBreakpointRejected guifg=red]])
		vim.cmd([[highlight	DapBreakpointCondition guifg=red]])
		vim.cmd([[highlight	DapLogPoint guifg=red]])

		-- automatically open and close dap-ui
		local dap, dapui = require("dap"), require("dapui")
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
