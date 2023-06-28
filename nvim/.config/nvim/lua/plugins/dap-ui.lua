return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"folke/neodev.nvim",
		"theHamsta/nvim-dap-virtual-text",
		"jay-babu/mason-nvim-dap.nvim",
	},
	keys = {
		{ "<leader>do", function() require('dapui').toggle() end },
		{ "<leader>dt", function() require('dap').toggle_breakpoint() end },
		{ "<leader>dT", function() require('dap').clear_breakpoints() end },
		{ "<F5>",       function() require('dap').continue() end },
		{ "<S-F5>",     function() require('dap').run_to_cursor() end },
		{ "<F6>",       function() require('dap').step_into() end },
		{ "<F7>",       function() require('dap').step_over() end },
		{ "<F8>",       function() require('dap').step_out() end },
		{ "<F9>",       function() require('dap').step_back() end },
		{ "<F10>",      function() require('dap').restart() end },
		{ "<F11>",      function() require('dap').terminate() end },
	},
	opts = {},
	config = function(_, opts)
		require('dapui').setup(opts)

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
