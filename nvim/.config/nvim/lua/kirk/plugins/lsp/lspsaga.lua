return {
  "nvimdev/lspsaga.nvim",
  enabled = false,
  dependencies = {
    "VonHeikemen/lsp-zero.nvim",
    "echasnovski/mini.icons",
    "nvim-treesitter/nvim-treesitter",
  },
  event = "LspAttach",
  cmd = "Lspsaga",
  keys = {
    {
      "<leader><leader>o",
      "<cmd>Lspsaga outline<CR>",
      desc = "Code outline",
    },
  },
  opts = {
    ui = {
      border = "rounded",
      title = true,
    },
    rename = {
      auto_save = true,
    },
    lightbulb = {
      enable = false,
      virtual_text = false,
    },
    symbol_in_winbar = {
      enable = false,
      separator = "/ ",
      folder_level = 8,
      respect_root = true,
      delay = 10,
    },
  },
}
