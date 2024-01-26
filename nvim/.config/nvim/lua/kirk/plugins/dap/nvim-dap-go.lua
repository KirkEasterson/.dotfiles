return {
  "leoluz/nvim-dap-go",
  cond = not vim.g.started_by_firenvim,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  version = "*",
  opts = {
    build_flags = "-tags=windows,linux,unittest,e2e",
  },
}
