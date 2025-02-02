return {
  "numToStr/Comment.nvim",
  dependencies = {
    "folke/ts-comments.nvim",
  },
  keys = {
    { "gc" },
    { "gb" },
    {
      "gcc",
      desc = "Toggle line comment",
    },
    {
      "gbc",
      desc = "Toggle block comment",
    },
    {
      "gcA",
      desc = "Add comment at end of line",
    },
    {
      "gco",
      desc = "Add comment below line",
    },
    {
      "gcO",
      desc = "Add comment above line",
    },
    {
      "gc",
      mode = "v",
      desc = "Toggle line comment",
    },
    {
      "gb",
      mode = "v",
      desc = "Toggle block comment",
    },
  },
  config = function(_, opts)
    if vim.fn.has("nvim-0.10.0") ~= 1 then
      opts = {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end

    require("Comment").setup(opts)
  end,
}
