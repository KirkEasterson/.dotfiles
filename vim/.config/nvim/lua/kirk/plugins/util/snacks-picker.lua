return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {

    -- vim
    {
      "<leader>fh",
      function()
        require("snacks").picker.help()
      end,
      desc = "Help",
    },
    {
      "<leader>fk",
      function()
        require("snacks").picker.keymaps()
      end,
      desc = "Keymaps",
    },
    {
      "<leader>fn",
      function()
        require("snacks").picker.notifications()
      end,
      desc = "Keymaps",
    },
    {
      "<leader>fm",
      function()
        require("snacks").picker.marks()
      end,
      desc = "Marks",
    },
    {
      "<leader>fM",
      function()
        require("snacks").picker.man()
      end,
      desc = "Man",
    },

    -- code navigation
    {
      "<leader>ff",
      function()
        require("snacks").picker.files({ hidden = true })
      end,
      desc = "Files",
    },
    {
      "<leader>fb",
      function()
        require("snacks").picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>fB",
      function()
        require("snacks").picker.lines()
      end,
      desc = "Current buffer",
    },
    {
      "<leader>fg",
      function()
        require("snacks").picker.grep({ hidden = true })
      end,
      desc = "Grep",
    },
    {
      "<leader>fG",
      function()
        require("snacks").picker.grep_word({ hidden = true })
      end,
      desc = "Grep word",
      mode = { "n", "v" },
    },
    {
      "<leader>fd",
      function()
        require("snacks").picker.diagnostics({ hidden = true })
      end,
      desc = "Diagnostics",
    },
    {
      "<leader>fD",
      function()
        require("snacks").picker.diagnostics_buffer({ hidden = true })
      end,
      desc = "Buffer diagnostics",
    },

    -- lsp
    {
      "<leader>fr",
      function()
        require("snacks").picker.lsp_references()
      end,
      desc = "LSP references",
    },
    {
      "<leader>fs",
      function()
        require("snacks").picker.lsp_symbols()
      end,
      desc = "LSP symbols",
    },
    {
      "<leader>fS",
      function()
        require("snacks").picker.lsp_workspace_symbols({ hidden = true })
      end,
      desc = "LSP symbols",
    },

    -- git
    {
      "<leader>fl",
      function()
        require("snacks").picker.git_log()
      end,
      desc = "Git log",
    },
    {
      "<leader>fL",
      function()
        require("snacks").picker.git_log_file()
      end,
      desc = "Git log file",
    },
  },
  opts = {
    picker = {
      enabled = true,
      prompt = " ",
      filename_bonus = true,
      cwd_bonus = true,
      layout = {
        preset = "ivy_split",
      },
    },
  },
}
