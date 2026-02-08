return {
  "williamboman/mason-lspconfig.nvim",
  event = "VeryLazy",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  cmd = {
    "LspInstall",
    "LspUninstall",
  },
  opts = {
    automatic_enable = true,
    ensure_installed = {
      "ansiblels",
      "bashls",
      "buf_ls", -- protobuf
      "clangd",
      "cmake",
      "csharp_ls",
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
      "omnisharp",
      "prismals",
      "pyright",
      "rust_analyzer",
      "sqlls",
      "svelte",
      "taplo", -- toml
      "terraformls",
      "tflint",
      "tinymist", -- typst
      "vimls",
      "vtsls",
      "yamlls",
      "zls", -- zig
      -- "asm_lsp", -- assembly
      -- "csharp_ls",
      -- "fsautocomplete",
      -- "hls", -- haskell
      -- "jdtls", -- java
      -- "kotlin_language_server",
      -- "ocamllsp",
      -- "rnix", -- nix
      -- "texlab",
    },
  },
}
