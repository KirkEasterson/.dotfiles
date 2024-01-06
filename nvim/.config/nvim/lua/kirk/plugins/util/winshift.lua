return {
  "sindrets/winshift.nvim",
  cond = not vim.g.started_by_firenvim,
  cmd = {
    "WinShift",
  },
  keys = {
    {
      "<leader><leader>s",
      vim.cmd.WinShift,
      desc = "Window move mode",
    },
    {
      "<C-S-h>",
      "<Cmd>WinShift left<CR>",
      desc = "Move window left",
      mode = { "n", "t" },
    },
    {
      "<C-S-j>",
      "<Cmd>WinShift down<CR>",
      desc = "Move window down",
      mode = { "n", "t" },
    },
    {
      "<C-S-k>",
      "<Cmd>WinShift up<CR>",
      desc = "Move window up",
      mode = { "n", "t" },
    },
    {
      "<C-S-l>",
      "<Cmd>WinShift right<CR>",
      desc = "Move window right",
      mode = { "n", "t" },
    },
  },
  opts = {},
}
