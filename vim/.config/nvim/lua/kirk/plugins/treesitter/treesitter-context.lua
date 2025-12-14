return {
  "nvim-treesitter/nvim-treesitter-context",
  -- enabled = false, -- causes issues with zig
  lazy = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = {
    "TSContextDisable",
    "TSContextEnable",
    "TSContextToggle",
  },
  event = "VeryLazy",
  opts = {
    mode = "cursor",
    multiwindow = true,
    max_lines = 5,
    multiline_threshold = 1,
  },
}
