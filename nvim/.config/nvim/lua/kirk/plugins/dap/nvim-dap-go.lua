return {
  "leoluz/nvim-dap-go",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    build_flags = "-tags=windows,linux,unittest,e2e",
  },
}
