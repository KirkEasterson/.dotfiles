return {
  "leoluz/nvim-dap-go",
  -- enabled = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    build_flags = "-tags=windows,linux,unittest,e2e",
  },
}
