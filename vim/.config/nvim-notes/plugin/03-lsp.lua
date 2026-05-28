vim.schedule(function()
  vim.pack.add({
    "https://github.com/williamboman/mason.nvim",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/williamboman/mason-lspconfig.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/antosha417/nvim-lsp-file-operations",
  })

  require("mason").setup({
    ui = {
      border = "rounded",
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  })

  require("mason-lspconfig").setup({
    automatic_enable = true,
    ensure_installed = {
      "diagnosticls", -- TODO: what is this?
      "eslint",
      "tinymist", -- typst
      "typos_lsp",
      "vale_ls",
    },
  })

  -- semantic tokens should be less than treesitter
  vim.highlight.priorities.semantic_tokens = 95

  require("lspconfig.ui.windows").default_options.border = "rounded"

  vim.lsp.enable({
    "tinymist",
  })
end)
