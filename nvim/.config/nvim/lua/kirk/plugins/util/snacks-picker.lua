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
        local filepath = vim.fn.expand("%")
        require("snacks").picker.files({
          hidden = (string.find(filepath, "dotfiles")) ~= nil or (string.find(filepath, ".config")) ~= nil,
          layout = {
            preset = "ivy_split",
            preview = false,
          },
        })
      end,
      desc = "Files",
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
        local filepath = vim.fn.expand("%")
        require("snacks").picker.grep({
          hidden = (string.find(filepath, "dotfiles")) ~= nil or (string.find(filepath, ".config")) ~= nil,
        })
      end,
      desc = "Grep",
    },
    {
      "<leader>fG",
      function()
        local filepath = vim.fn.expand("%")
        require("snacks").picker.grep_word({
          hidden = (string.find(filepath, "dotfiles")) ~= nil or (string.find(filepath, ".config")) ~= nil,
        })
      end,
      desc = "Grep word",
      mode = { "n", "v" },
    },
    {
      "<leader>fd",
      function()
        local filepath = vim.fn.expand("%")
        require("snacks").picker.diagnostics({
          hidden = (string.find(filepath, "dotfiles")) ~= nil or (string.find(filepath, ".config")) ~= nil,
          layout = {
            preset = "ivy_split",
          },
        })
      end,
      desc = "Diagnostics",
    },
    {
      "<leader>fD",
      function()
        local filepath = vim.fn.expand("%")
        require("snacks").picker.diagnostics_buffer({
          hidden = (string.find(filepath, "dotfiles")) ~= nil or (string.find(filepath, ".config")) ~= nil,
          layout = {
            preset = "ivy_split",
          },
        })
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
        require("snacks").picker.lsp_symbols({
          layout = {
            preset = "ivy_split",
          },
        })
      end,
      desc = "LSP symbols",
    },
    {
      "<leader>fS",
      function()
        local filepath = vim.fn.expand("%")
        require("snacks").picker.lsp_workspace_symbols({
          hidden = (string.find(filepath, "dotfiles")) ~= nil or (string.find(filepath, ".config")) ~= nil,
          layout = {
            preset = "ivy_split",
          },
        })
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
    },
  },
}
