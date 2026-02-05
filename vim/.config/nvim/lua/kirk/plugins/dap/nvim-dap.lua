return {
  "mfussenegger/nvim-dap",
  -- enabled = false,
  dependencies = {
    "leoluz/nvim-dap-go",
  },
  keys = {
    {
      "<leader>dp",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle breakpoint",
    },
    {
      "<leader>dP",
      function()
        require("dap").clear_breakpoints()
      end,
      desc = "Clear breakpoints",
    },
    {
      "<leader>du",
      function()
        require("dap").continue()
      end,
      desc = "Continue program",
    },
    {
      "<leader>dU",
      function()
        require("dap").run_to_cursor()
      end,
      desc = "Run to cursor",
    },
    {
      "<leader>di",
      function()
        require("dap").step_into()
      end,
      desc = "Step into",
    },
    {
      "<leader>dI",
      function()
        require("dap").step_out()
      end,
      desc = "Step out",
    },
    {
      "<leader>do",
      function()
        require("dap").step_over()
      end,
      desc = "Step over",
    },
    {
      "<leader>dO",
      function()
        require("dap").step_back()
      end,
      desc = "Step back",
    },
    {
      "<leader>dy",
      function()
        require("dap").restart()
      end,
      desc = "Restart program",
    },
    {
      "<leader>dY",
      function()
        require("dap").terminate()
      end,
      desc = "Terminate program",
    },
    {
      "<leader>dt",
      function()
        require("dap-go").debug_test()
      end,
      desc = "Debug test",
      ft = "go",
    },
  },
  init = function()
    vim.cmd([[highlight	DapBreakpoint guifg=red]])
    vim.cmd([[highlight	DapBreakpointCondition guifg=yellow]])
    vim.cmd([[highlight	DapLogPoint guifg=blue]])
    vim.cmd([[highlight	DapStopped guifg=green]])
    vim.cmd([[highlight	DapBreakpointRejected guifg=grey]])

    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DapBreakpointCondition" })
    vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint" })
    vim.fn.sign_define("DapStopped", { text = "󰘍", texthl = "DapStopped" })
    vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpointRejected" })
  end,
}
