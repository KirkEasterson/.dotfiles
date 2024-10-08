return {
  "nvim-telescope/telescope-frecency.nvim",
  enabled = false,
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "echasnovski/mini.icons",
  },
  keys = {
    {
      "<leader>fy",
      function()
        require("telescope").extensions.frecency.frecency()
      end,
      desc = "Telescope frecency",
    },
  },
  opts = {
    extensions = {
      frecency = {
        default_workspace = "CWD",
        show_scores = true,
        show_unindexed = true,
        ignore_patterns = {
          "*.git/*",
          "*/tmp/*",
          "term://*",
        },
      },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("frecency")
  end,
}
