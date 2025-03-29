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
        if next(require("diffview.lib").views) == nil then
          require("diffview").open({
            require("util").git_default_branch(),
            "--untracked-files=no",
          })
        else
          require("diffview").close()
        end
      end,
      desc = "Toggle diff view",
    },
    {
      "<leader>dvh",
      function()
        if next(require("diffview.lib").views) == nil then
          vim.cmd.DiffviewFileHistory("%")
        else
          require("diffview").close()
        end
      end,
      desc = "Open diff view with file history",
    },
    {
      "<leader>dvH",
      function()
        if next(require("diffview.lib").views) == nil then
          require("diffview").file_history(nil, {})
        else
          require("diffview").close()
        end
      end,
      desc = "Open diff view with branch history",
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
