return {
  "m4xshen/hardtime.nvim",
  cond = not vim.g.started_by_firenvim,
  cmd = "Hardtime",
  keys = {
    {
      "<leader>ht",
      function()
        require("hardtime").toggle()
      end,
      desc = "Toggle hardtime",
    },
  },
  opts = {},
}
