return {
  "nvimdev/lspsaga.nvim",
  enabled = false,
  cond = not vim.g.started_by_firenvim,
  dependencies = {
    "VonHeikemen/lsp-zero.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = "Lspsaga",
  keys = {
    {
      "<leader><leader>o",
      "<cmd>Lspsaga outline<CR>",
      desc = "Code outline",
    },
    {
      "<leader>ga",
      "<cmd>Lspsaga code_action<CR>",
      desc = "Code action",
    },
    {
      "<leader>e",
      "<cmd>Lspsaga show_line_diagnostics<CR>",
      desc = "Line diagnostics",
    },
    {
      "<leader>gu",
      "<cmd>Lspsaga finder<CR>",
      desc = "LSP finder",
    },
    {
      "<leader>rn",
      "<cmd>Lspsaga rename<CR>",
      desc = "Rename",
    },
    {
      "K",
      "<cmd>Lspsaga hover_doc<CR>",
      desc = "Hover docs",
    },
    {
      "[d",
      "<cmd>Lspsaga diagnostic_jump_prev<CR>",
      desc = "Previous diagnostic",
    },
    {
      "]d",
      "<cmd>Lspsaga diagnostic_jump_next<CR>",
      desc = "Next diagnostic",
    },
    {
      "gb",
      "<cmd>Lspsaga show_buf_diagnostics<CR>",
      desc = "Buffer diagnostics",
    },
    {
      "gd",
      "<cmd>Lspsaga goto_definition<CR>",
      desc = "Definition",
    },
    {
      "gt",
      "<cmd>Lspsaga goto_type_definition<CR>",
      desc = "Type definition",
    },
  },
  opts = {
    ui = {
      border = "rounded",
    },
    rename = {
      auto_save = true,
    },
    lightbulb = {
      virtual_text = false,
    },
    symbol_in_winbar = {
      enable = false, -- disabled to avoid having this plugin load at startup
      separator = "  ",
      folder_level = 8,
      respect_root = true,
      delay = 10,
    },
  },
}
