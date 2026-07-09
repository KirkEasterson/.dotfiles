vim.schedule(function()
  vim.pack.add({
    { src = "https://github.com/williamboman/mason.nvim", version = vim.version.range("*") },
    { src = "https://github.com/neovim/nvim-lspconfig", version = vim.version.range("*") },
    { src = "https://github.com/williamboman/mason-lspconfig.nvim", version = vim.version.range("*") },
    { src = "https://github.com/nvim-lua/plenary.nvim", version = vim.version.range("*") },
    { src = "https://github.com/antosha417/nvim-lsp-file-operations", version = vim.version.range("*") },
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
