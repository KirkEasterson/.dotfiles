return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"folke/neodev.nvim",
		"theHamsta/nvim-dap-virtual-text",
		"jay-babu/mason-nvim-dap.nvim",
	},
	version = "v3.8.*",
	keys = {
		{
			"<leader>do",
			function() require('dapui').toggle() end,
			desc = "Toggle debug UI",
		},
		{
			"<leader>dt",
			function() require('dap').toggle_breakpoint() end,
			desc = "Toggle breakpoint",
		},
		{
			"<leader>dT",
			function() require('dap').clear_breakpoints() end,
			desc = "Clear breakpoints",
		},
		{
			"<F5>",
			function() require('dap').continue() end,
			desc = "Continue program",
		},
		{
			"<S-F5>",
			function() require('dap').run_to_cursor() end,
			desc = "Run to cursor",
		},
		{
			"<F6>",
			function() require('dap').step_into() end,
			desc = "Step into",
		},
		{
			"<F7>",
			function() require('dap').step_over() end,
			desc = "Step over",
		},
		{
			"<F8>",
			function() require('dap').step_out() end,
			desc = "Step out",
		},
		{
			"<F9>",
			function() require('dap').step_back() end,
			desc = "Step back",
		},
		{
			"<F10>",
			function() require('dap').restart() end,
			desc = "Restart program",
		},
		{
			"<F11>",
			function() require('dap').terminate() end,
			desc = "Terminate program",
		},
	},
	opts = {},
	init = function()
		vim.cmd [[highlight	DapBreakpoint guifg=red]]
		vim.cmd [[highlight	DapBreakpointRejected guifg=red]]
		vim.cmd [[highlight	DapBreakpointCondition guifg=red]]
		vim.cmd [[highlight	DapLogPoint guifg=red]]

		-- local dap, dapui = require("dap"), require("dapui")
		-- dap.listeners.after.event_initialized["dapui_config"] = function()
		-- 	dapui.open()
		-- end
		-- dap.listeners.before.event_terminated["dapui_config"] = function()
		-- 	dapui.close()
		-- end
		-- dap.listeners.before.event_exited["dapui_config"] = function()
		-- 	dapui.close()
		-- end
	end
}
