return {
  "mfussenegger/nvim-dap",
  enabled = false,
  dependencies = {
    "leoluz/nvim-dap-go",
    "Joakker/lua-json5",
  },
  keys = {
    {
      "<leader>dt",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle breakpoint",
    },
    {
      "<leader>dT",
      function()
        require("dap").clear_breakpoints()
      end,
      desc = "Clear breakpoints",
    },
    {
      "<F5>",
      function()
        require("dap").continue()
      end,
      desc = "Continue program",
    },
    {
      "<S-F5>",
      function()
        require("dap").run_to_cursor()
      end,
      desc = "Run to cursor",
    },
    {
      "<F6>",
      function()
        require("dap").step_into()
      end,
      desc = "Step into",
    },
    {
      "<F7>",
      function()
        require("dap").step_over()
      end,
      desc = "Step over",
    },
    {
      "<F8>",
      function()
        require("dap").step_out()
      end,
      desc = "Step out",
    },
    {
      "<F9>",
      function()
        require("dap").step_back()
      end,
      desc = "Step back",
    },
    {
      "<F10>",
      function()
        require("dap").restart()
      end,
      desc = "Restart program",
    },
    {
      "<F11>",
      function()
        require("dap").terminate()
      end,
      desc = "Terminate program",
    },
  },
  config = function()
    require("dap.ext.vscode").json_decode = require("json5").parse
    require("dap.ext.vscode").load_launchjs(nil, {
      cppdbg = { "c", "cpp" },
      node = { "javascript", "javascriptreact", "typescriptreact", "typescript" },
    })
  end,
  init = function()
    -- TODO: merge this with highlight
    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointRejected", { text = "󰋗", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "󰅙", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define("DapLogPoint", { text = "󰛿", texthl = "", linehl = "", numhl = "" })

    vim.cmd([[highlight	DapBreakpoint guifg=red]])
    vim.cmd([[highlight	DapBreakpointRejected guifg=red]])
    vim.cmd([[highlight	DapBreakpointCondition guifg=red]])
    vim.cmd([[highlight	DapLogPoint guifg=red]])
  end,
}
