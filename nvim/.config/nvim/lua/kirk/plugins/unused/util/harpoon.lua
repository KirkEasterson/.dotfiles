return {
  "ThePrimeagen/harpoon",
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    {
      "<leader>h",
      desc = "Harpoon",
    },
    {
      "<leader>ha",
      function()
        require("harpoon.mark").add_file()
      end,
      desc = "Add harpoon mark",
    },
    {
      "<leader>hp",
      function()
        require("harpoon.mark").nav_prev()
      end,
      desc = "Prev harpoon mark",
    },
    {
      "<leader>hn",
      function()
        require("harpoon.mark").nav_next()
      end,
      desc = "Next harpoon mark",
    },
    {
      "<leader>hm",
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      desc = "Toggle harpoon UI",
    },
    {
      "<leader>h1",
      function()
        require("harpoon.ui").nav_file(1)
      end,
      desc = "Harpoon file 1",
    },
    {
      "<leader>h2",
      function()
        require("harpoon.ui").nav_file(2)
      end,
      desc = "Harpoon file 2",
    },
    {
      "<leader>h3",
      function()
        require("harpoon.ui").nav_file(3)
      end,
      desc = "Harpoon file 3",
    },
    {
      "<leader>h4",
      function()
        require("harpoon.ui").nav_file(4)
      end,
      desc = "Harpoon file 4",
    },
    {
      "<leader>ht",
      "<Cmd>Telescope harpoon marks<CR>",
      desc = "Harpoon marks",
    },
  },
  opts = {
    mark_branch = true,
  },
  config = function(_, opts)
    require("harpoon").setup(opts)
    require("telescope").load_extension("harpoon")
  end,
}
