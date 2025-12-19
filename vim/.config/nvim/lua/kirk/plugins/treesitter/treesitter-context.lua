return {
  "nvim-treesitter/nvim-treesitter-context",
  -- enabled = false, -- causes issues with zig
  version = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = {
    "TSContextDisable",
    "TSContextEnable",
    "TSContextToggle",
  },
  lazy = false,
  opts = {
    mode = "cursor",
    multiwindow = true,
    max_lines = 5,
    multiline_threshold = 1,
  },
}
