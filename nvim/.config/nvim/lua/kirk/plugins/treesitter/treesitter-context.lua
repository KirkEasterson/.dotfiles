return {
  "nvim-treesitter/nvim-treesitter-context",
  -- enabled = false, -- causes issues with zig
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = {
    "TSContextDisable",
    "TSContextEnable",
    "TSContextToggle",
  },
  event = {
    "BufNewFile",
    "BufReadPost",
  },
  opts = {
    mode = "cursor",
    multiwindow = true,
    max_lines = 5,
    multiline_threshold = 1,
  },
}
