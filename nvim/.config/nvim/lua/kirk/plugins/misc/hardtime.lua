return {
  "m4xshen/hardtime.nvim",
  enabled = false,
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
