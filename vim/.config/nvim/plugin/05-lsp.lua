vim.schedule(function()
  vim.pack.add({
    -- ALREADY LOADED DEPENDENCIES
    -- "https://github.com/williamboman/mason.nvim",

    { src = "https://github.com/neovim/nvim-lspconfig", version = vim.version.range("*") },
    { src = "https://github.com/williamboman/mason-lspconfig.nvim", version = vim.version.range("*") },
    { src = "https://github.com/nvim-lua/plenary.nvim", version = vim.version.range("*") },
    { src = "https://github.com/antosha417/nvim-lsp-file-operations", version = vim.version.range("*") },
  })

  require("lspconfig.ui.windows").default_options.border = "rounded"

  require("lsp-file-operations").setup()
  vim.lsp.config("*", {
    capabilities = require("lsp-file-operations").default_capabilities(),
  })

  vim.lsp.enable({
    "lua_ls",
    "omnisharp",
    "tinymist",
  })

  require("mason-lspconfig").setup({
    automatic_enable = true,
    ensure_installed = {
      "ansiblels",
      "bashls",
      "buf_ls", -- protobuf
      "clangd",
      "cmake",
      "cssls",
      "diagnosticls",
      "docker_compose_language_service",
      "dockerls",
      "eslint",
      "golangci_lint_ls",
      "gopls",
      "helm_ls",
      "html",
      "jsonls",
      "lemminx", -- xml
      "lua_ls",
      "pyright",
      "regal",
      "rust_analyzer",
      "sqlls",
      "taplo", -- toml
      "terraformls",
      "tflint",
      "tinymist", -- typst
      "typos_lsp",
      "vale_ls",
      "vimls",
      "vtsls",
      "yamlls",
      "zls", -- zig
      -- "ocamllsp",
      -- "rnix", -- nix
      -- "texlab",
    },
  })

  -- LSP folding
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }
  local language_servers = vim.lsp.get_clients()
  for _, ls in ipairs(language_servers) do
    require("lspconfig")[ls].setup({
      capabilities = capabilities,
    })
  end
end)
