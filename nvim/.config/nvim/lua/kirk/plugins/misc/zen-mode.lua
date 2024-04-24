return {
  "folke/zen-mode.nvim",
  enabled = false,
  dependencies = {
    "folke/twilight.nvim",
  },
  cmd = "ZenMode",
  keys = {
    {
      "<leader>ZM",
      function()
        require("zen-mode").toggle()
      end,
      desc = "Toggle zen mode",
    },
  },
  opts = {
    window = {
      options = {
        foldcolumn = "0",
        cursorcolumn = false,
        list = false,
      },
    },
    plugins = {
      options = {
        ruler = true,
      },
      tmux = {
        enabled = true,
      },
      wezterm = {
        enabled = true,
        font = "+2",
      },
      alacritty = {
        enabled = true,
        font = "10",
      },
      kitty = {
        enabled = true,
        font = "+2",
      },
    },
  },
}
