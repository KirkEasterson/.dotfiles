vim.pack.add({
  -- ALREADY LOADED DEPENDENCIES
  -- "https://github.com/williamboman/mason.nvim",

  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/williamboman/mason-lspconfig.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/antosha417/nvim-lsp-file-operations",
})

-- semantic tokens should be less than treesitter
vim.highlight.priorities.semantic_tokens = 95

require("lspconfig.ui.windows").default_options.border = "rounded"

require("lsp-file-operations").setup()
vim.lsp.config("*", {
  capabilities = require("lsp-file-operations").default_capabilities(),
})

-- TODO: migrate to lsp/
vim.lsp.config("omnisharp", {
  -- handlers = {
  -- 	["textDocument/definition"] = require("omnisharp_extended").handler,
  -- },
  cmd = {
    "omnisharp",
    "--languageserver",
    "--hostPID",
    tostring(vim.fn.getpid()),
  },
  enable_import_completion = true,
  organize_imports_on_format = true,
})

vim.lsp.enable({
  "lua_ls",
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
})

vim.keymap.set({ "n" }, "gd", function()
  vim.lsp.buf.definition()
end, { desc = "Go to definition" })
vim.keymap.set({ "n" }, "gD", function()
  vim.lsp.buf.declaration()
end, { desc = "Go to declaration" })
vim.keymap.set({ "n" }, "gi", function()
  vim.lsp.buf.implementation()
end, { desc = "Go to implementation" })
vim.keymap.set({ "n" }, "go", function()
  vim.lsp.buf.type_definition()
end, { desc = "Go to type definition" })
vim.keymap.set({ "n" }, "gr", function()
  vim.lsp.buf.references()
end, { desc = "Go to reference" })
vim.keymap.set({ "n" }, "ga", function()
  vim.lsp.buf.code_action()
end, { desc = "Rename" })
vim.keymap.set({ "n" }, "gl", function()
  vim.diagnostic.open_float()
end, { desc = "Diagnostics" })
vim.keymap.set({ "n" }, "<leader>rn", function()
  vim.lsp.buf.rename()
end, { desc = "Rename" })
