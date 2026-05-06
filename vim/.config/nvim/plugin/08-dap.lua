vim.pack.add({
  -- ALREADY LOADED DEPENDENCIES
  -- "https://github.com/nvim-treesitter/nvim-treesitter",
  -- "https://github.com/williamboman/mason.nvim",

  "https://github.com/leoluz/nvim-dap-go",
  "https://github.com/mfussenegger/nvim-dap",
  "https://github.com/jay-babu/mason-nvim-dap.nvim",
  "https://github.com/nvim-neotest/nvim-nio",
  "https://github.com/theHamsta/nvim-dap-virtual-text",
  "https://github.com/rcarriga/nvim-dap-ui",
  "https://github.com/Weissle/persistent-breakpoints.nvim",
})

vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "red" })
vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = "yellow" })
vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "blue" })
vim.api.nvim_set_hl(0, "DapStopped", { fg = "green" })
vim.api.nvim_set_hl(0, "DapBreakpointRejected", { fg = "grey" })

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint" })
vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DapBreakpointCondition" })
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint" })
vim.fn.sign_define("DapStopped", { text = "󰁕", texthl = "DapStopped" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpointRejected" })

require("mason-nvim-dap").setup({
  automatic_installation = true,
  automatic_setup = true,
  ensure_installed = {
    "bash",
    "delve",
    "js",
    "python",
  },
  handlers = {
    function(config)
      require("mason-nvim-dap").default_setup(config)
    end,
  },
})

require("nvim-dap-virtual-text").setup({
  commented = true,
  only_first_definition = false,
  all_references = true,
  virt_text_pos = "eol",
})

local dap, dapui = require("dap"), require("dapui")
dapui.setup({
  expand_lines = false,
})
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

require("persistent-breakpoints").setup({
  load_breakpoints_event = { "BufReadPost" },
})

require("dap-go").setup({
  build_flags = "-tags=windows,linux,unittest,e2e",
})

vim.keymap.set({ "n" }, "<leader>dk", function()
  require("dapui").toggle()
end, { desc = "Toggle debug UI" })

vim.keymap.set({ "n" }, "<leader>dp", function()
  require("persistent-breakpoints.api").toggle_breakpoint()
end, { desc = "Toggle breakpoint" })
vim.keymap.set({ "n" }, "<leader>dP", function()
  require("persistent-breakpoints.api").clear_all_breakpoints()
end, { desc = "Clear breakpoint" })

vim.keymap.set({ "n" }, "<leader>du", function()
  require("dap").continue()
end, { desc = "Continue program" })
vim.keymap.set({ "n" }, "<leader>dU", function()
  require("dap").run_to_cursor()
end, { desc = "Run to cursor" })
vim.keymap.set({ "n" }, "<leader>di", function()
  require("dap").step_into()
end, { desc = "Step into" })
vim.keymap.set({ "n" }, "<leader>dI", function()
  require("dap").step_out()
end, { desc = "Step out" })
vim.keymap.set({ "n" }, "<leader>do", function()
  require("dap").step_over()
end, { desc = "Step over" })
vim.keymap.set({ "n" }, "<leader>dO", function()
  require("dap").step_back()
end, { desc = "Step back" })
vim.keymap.set({ "n" }, "<leader>dy", function()
  require("dap").restart()
end, { desc = "Restart program" })
vim.keymap.set({ "n" }, "<leader>dY", function()
  require("dap").terminate()
end, { desc = "Terminate program" })
