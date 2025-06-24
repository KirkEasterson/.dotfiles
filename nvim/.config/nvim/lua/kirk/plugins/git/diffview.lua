--- toggle diffview views
--- @param open_view function function to open the view
local function toggle_view(open_view)
  if next(require("diffview.lib").views) == nil then
    open_view()
  else
    require("diffview").close()
  end
end

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
        toggle_view(function()
          require("diffview").open({
            require("util").git_default_branch(),
            "--untracked-files=no",
          })
        end)
      end,
      desc = "Toggle diff view",
    },
    {
      "<leader>dvh",
      function()
        toggle_view(function()
          vim.cmd.DiffviewFileHistory("%")
        end)
      end,
      desc = "Open diff view with file history",
    },
    {
      "<leader>dvH",
      function()
        toggle_view(function()
          require("diffview").file_history(nil, {})
        end)
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
