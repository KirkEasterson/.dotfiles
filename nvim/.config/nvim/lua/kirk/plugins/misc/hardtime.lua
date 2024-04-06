return {
  "m4xshen/hardtime.nvim",
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
