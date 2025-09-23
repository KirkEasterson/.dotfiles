return {
  "rcarriga/nvim-dap-ui",
  -- enabled = false,
  version = false, -- https://github.com/rcarriga/nvim-dap-ui/issues/343
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
    "jay-babu/mason-nvim-dap.nvim",
    "theHamsta/nvim-dap-virtual-text",
  },
  keys = {
    {
      "<leader>dk",
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

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
}
