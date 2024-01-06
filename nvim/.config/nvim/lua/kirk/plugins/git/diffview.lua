return {
  "sindrets/diffview.nvim",
  cond = not vim.g.started_by_firenvim,
  -- enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  cmd = {
    "DiffviewClose",
    "DiffviewFileHistory",
    "DiffviewFocusFiles",
    "DiffviewOpen",
    "DiffviewRefresh",
    "DiffviewToggleFiles",
  },
  keys = {
    {
      "<leader>dvo",
      function()
        require("diffview").open("main")
      end,
      desc = "Open diff main",
    },
    {
      "<leader>dvc",
      function()
        require("diffview").close()
      end,
      desc = "Close diff",
    },
  },
  init = function()
    vim.opt.fillchars:append({ diff = "╱" })
  end,
  config = function()
    require("diffview").setup({
      enhanced_diff_hl = true,
      view = {
        default = {
          winbar_info = true,
        },
        merge_tool = {
          winbar_info = true,
        },
        file_history = {
          winbar_info = true,
        },
      },
      keymaps = {
        file_panel = {
          {
            "n",
            "<c-u>",
            require("diffview.actions").scroll_view(-0.1),
            {
              desc = "Scroll the view up",
            },
          },
          {
            "n",
            "<c-d>",
            require("diffview.actions").scroll_view(0.1),
            {
              desc = "Scroll the view down",
            },
          },
        },
        file_history_panel = {
          {
            "n",
            "<c-u>",
            require("diffview.actions").scroll_view(-0.1),
            {
              desc = "Scroll the view up",
            },
          },
          {
            "n",
            "<c-d>",
            require("diffview.actions").scroll_view(0.1),
            {
              desc = "Scroll the view down",
            },
          },
        },
      },
    })
  end,
}
