return {
  "cbochs/grapple.nvim",
  dependencies = {
    "echasnovski/mini.icons",
  },
  event = { "BufReadPost", "BufNewFile" },
  cmd = "Grapple",
  opts = {
    scope = "git_branch",
  },
  keys = {
    {
      "<leader>ht",
      function()
        require("grapple").toggle()
      end,
      desc = "Grapple toggle tag",
    },
    {
      "<leader>hw",
      function()
        require("grapple").toggle_tags()
      end,
      desc = "Grapple open tags window",
    },
    {
      "<leader>1",
      function()
        require("grapple").select({ index = 1 })
      end,
      desc = "Grapple Grapple file 1",
    },
    {
      "<leader>2",
      function()
        require("grapple").select({ index = 2 })
      end,
      desc = "Grapple Grapple file 2",
    },
    {
      "<leader>3",
      function()
        require("grapple").select({ index = 3 })
      end,
      desc = "Grapple Grapple file 3",
    },
    {
      "<leader>4",
      function()
        require("grapple").select({ index = 4 })
      end,
      desc = "Grapple Grapple file 4",
    },
  },
}
