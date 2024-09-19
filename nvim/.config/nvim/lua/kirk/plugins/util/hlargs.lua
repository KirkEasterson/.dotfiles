return {
  "m-demare/hlargs.nvim",
  enabled = false,
  cond = vim.version().api_level < 10,
  event = "BufEnter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {},
}
