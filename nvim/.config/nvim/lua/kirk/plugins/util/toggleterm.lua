return {
  "akinsho/toggleterm.nvim",
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
      "<leader>tt",
      function()
        require("toggleterm").toggle()
      end,
      desc = "Terminal - toggle",
      mode = { "n", "t" },
    },
    {
      "<leader>tv",
      function()
        require("toggleterm").toggle(nil, vim.o.columns * 0.5, "vertical", "vertical")
      end,
      desc = "Terminal - vertical",
      mode = { "n", "t" },
    },
    {
      "<leader>th",
      function()
        require("toggleterm").toggle(nil, vim.o.lines * 0.3, "horizontal", "horizontal")
      end,
      desc = "Terminal - horizontal",
      mode = { "n", "t" },
    },
  },
  opts = {
    shade_terminals = false,
  },
}
