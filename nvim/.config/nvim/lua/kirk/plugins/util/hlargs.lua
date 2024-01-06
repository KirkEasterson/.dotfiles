return {
  "m-demare/hlargs.nvim",
  cond = vim.version().api_level < 10 and not vim.g.started_by_firenvim,
  event = "BufEnter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {},
}
