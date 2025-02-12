return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    {
      "<leader>ff",
      function()
        require("snacks").picker.files({
          hidden = (string.find(vim.fn.expand("%"), "dotfiles")) ~= nil,
          layout = {
            preset = "ivy_split",
            preview = false,
          },
        })
      end,
      desc = "Find files",
    },
    {
      "<leader>fb",
      function()
        require("snacks").picker.buffers({
          layout = {
            preset = "ivy_split",
            preview = false,
          },
        })
      end,
      desc = "Search buffers",
    },
    {
      "<leader>fB",
      function()
        require("snacks").picker.lines()
      end,
      desc = "Search current buffer",
    },
    {
      "<leader>fg",
      function()
        require("snacks").picker.grep()
      end,
      desc = "Project search",
    },
    {
      "<leader>fG",
      function()
        require("snacks").picker.grep_word()
      end,
      desc = "Search for current word",
      mode = { "n", "v" },
    },
    {
      "<leader>fr",
      function()
        require("snacks").picker.lsp_references()
      end,
      desc = "LSP references",
    },
  },
  opts = {
    picker = {
      enabled = true,
      prompt = " ",
      filename_bonus = true,
      cwd_bonus = true,
    },
  },
}
