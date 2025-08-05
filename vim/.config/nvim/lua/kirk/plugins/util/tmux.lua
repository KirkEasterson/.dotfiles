-- this plugin also handles pane control _outside_ of TMUX

return {
  "aserowy/tmux.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<C-h>",
      function()
        require("tmux").move_left()
      end,
      desc = "Move left",
    },
    {
      "<C-j>",
      function()
        require("tmux").move_bottom()
      end,
      desc = "Move down",
    },
    {
      "<C-k>",
      function()
        require("tmux").move_top()
      end,
      desc = "Move up",
    },
    {
      "<C-l>",
      function()
        require("tmux").move_right()
      end,
      desc = "Move right",
    },
    {
      "<M-h>",
      function()
        require("tmux").resize_left()
      end,
      desc = "Resize left",
    },
    {
      "<M-j>",
      function()
        require("tmux").resize_bottom()
      end,
      desc = "Resize down",
    },
    {
      "<M-k>",
      function()
        require("tmux").resize_top()
      end,
      desc = "Resize up",
    },
    {
      "<M-l>",
      function()
        require("tmux").resize_right()
      end,
      desc = "Resize right",
    },
  },
  opts = {
    copy_sync = {
      enable = false,
    },
    resize = {
      resize_step_x = 8,
      resize_step_y = 4,
    },
  },
}
