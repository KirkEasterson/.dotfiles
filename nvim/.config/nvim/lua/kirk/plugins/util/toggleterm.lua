return {
  "akinsho/toggleterm.nvim",
  enabled = false,
  cmd = {
    "TermSelect",
    "ToggleTerm",
    "ToggleTermSendCurrentLine",
    "ToggleTermSendVisualLines",
    "ToggleTermSendVisualSelection",
    "ToggleTermSetName",
    "ToggleTermToggleAll",
  },
  keys = {
    {
      "<F12>",
      function()
        require("toggleterm").toggle()
      end,
      desc = "Terminal - toggle",
      mode = { "n", "t" },
    },
  },
  opts = {
    shade_terminals = false,
  },
}
