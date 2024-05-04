return {
  "mfussenegger/nvim-dap",
  enabled = false,
  dependencies = {
    "leoluz/nvim-dap-go",
    "Joakker/lua-json5",
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
