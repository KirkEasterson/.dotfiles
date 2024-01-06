return {
  "famiu/bufdelete.nvim",
  cond = not vim.g.started_by_firenvim,
  enabled = false, -- TODO: replace with a simple binding
  cmd = {
    "Bdelete",
    "Bwipeout",
  },
  keys = {
    {
      "<C-w>",
      function()
        require("bufdelete").bufdelete(0, false)
      end,
      desc = "Delete current buffer",
    },
  },
}
