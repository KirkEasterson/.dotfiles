return {
  "m-demare/hlargs.nvim",
  cond = vim.version().api_level < 10,
  event = "BufEnter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {},
}
