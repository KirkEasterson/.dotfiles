return {
  "folke/which-key.nvim",
  cond = not vim.g.started_by_firenvim,
  version = "v1.5.*",
  event = "VeryLazy",
  cmd = "WhichKey",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    window = {
      border = "rounded",
    },
  },
}
