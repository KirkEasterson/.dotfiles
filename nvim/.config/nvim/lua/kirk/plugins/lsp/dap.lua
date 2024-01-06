return {
  "mfussenegger/nvim-dap",
  cond = not vim.g.started_by_firenvim,
  version = "*",
  config = false,
  init = function()
    vim.cmd([[highlight	DapBreakpoint guifg=red]])
    vim.cmd([[highlight	DapBreakpointRejected guifg=red]])
    vim.cmd([[highlight	DapBreakpointCondition guifg=red]])
    vim.cmd([[highlight	DapLogPoint guifg=red]])
  end,
}
