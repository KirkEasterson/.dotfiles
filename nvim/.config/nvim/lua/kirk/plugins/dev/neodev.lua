return {
  "folke/neodev.nvim",
  cond = not vim.g.started_by_firenvim,
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/neotest",
  },
  opts = {
    library = {
      plugins = {
        "nvim-dap-ui",
        "neotest",
      },
      types = true,
    },
  },
}
