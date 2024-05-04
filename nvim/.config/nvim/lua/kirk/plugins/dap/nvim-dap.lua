return {
  "mfussenegger/nvim-dap",
  enabled = false,
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
  config = false,
}
