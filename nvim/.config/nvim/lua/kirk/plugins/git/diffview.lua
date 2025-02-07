return {
  "sindrets/diffview.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "echasnovski/mini.icons",
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
        require("diffview").open({
          require("util").git_default_branch(),
          "--untracked-files=no",
        })
      end,
      desc = "Open diff view",
    },
    {
      "<leader>dvO",
      function()
        require("diffview").open({})
      end,
      desc = "Open diff view with untracked files",
    },
    {
      "<leader>dvh",
      function()
        vim.cmd.DiffviewFileHistory("%")
      end,
      desc = "Open diff view with file history",
    },
    {
      "<leader>dvH",
      function()
        require("diffview").file_history(nil, {})
      end,
      desc = "Open diff view with branch history",
    },
    {
      "<leader>dvc",
      function()
        require("diffview").close()
      end,
      desc = "Close diff view",
    },
  },
  opts = {
    enhanced_diff_hl = true,
    show_help_hints = false,
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
    file_panel = {
      win_config = {
        position = "bottom",
        height = 10,
      },
    },
    file_history_panel = {
      win_config = {
        position = "bottom",
        height = 10,
      },
    },
  },
}
