return {
  "stevearc/dressing.nvim",
  -- enabled = false,
  event = {
    "BufNewFile",
    "BufReadPost",
  },
  opts = {
    input = {
      insert_only = false,
      start_in_insert = false,
    },
  },
}
