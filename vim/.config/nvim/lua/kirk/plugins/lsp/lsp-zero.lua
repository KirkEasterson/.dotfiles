-- TODO:: remove <C-w>d and <C-w><C-d> mapping for diagnostics under cursor
return {
  "VonHeikemen/lsp-zero.nvim",
  enabled = false,
  event = "VeryLazy",
  dependencies = {
    -- LSP Support
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "antosha417/nvim-lsp-file-operations",

    "nvim-lua/plenary.nvim",
  },
  cmd = {
    "LspInstall",
    "LspUninstall",
    "LspZeroFormat",
    "LspZeroSetupServers",
    "LspZeroWorkspaceAdd",
    "LspZeroWorkspaceList",
    "LspZeroWorkspaceRemove",
  },
  opts = {},
  config = function(_, opts)
    local lsp_zero = require("lsp-zero")

    local on_attach = function(client, bufnr)
      client.server_capabilities =
        vim.tbl_deep_extend("force", client.server_capabilities, require("lsp-file-operations").default_capabilities())

      -- -- for ufo folding
      -- if client.server_capabilities.textDocument == nil then
      --   client.server_capabilities.textDocument = {}
      -- end
      -- client.server_capabilities.textDocument.foldingRange = {
      --   dynamicRegistration = false,
      --   lineFoldingOnly = true,
      -- }
    end

    lsp_zero.on_attach(on_attach)

    lsp_zero.configure("omnisharp", {
      -- handlers = {
      -- 	["textDocument/definition"] = require("omnisharp_extended").handler,
      -- },
      on_attach = function(client, bufnr)
        client.server_capabilities.semanticTokensProvider = nil
        on_attach(client, bufnr)
      end,
      cmd = {
        "omnisharp",
        "--languageserver",
        "--hostPID",
        tostring(vim.fn.getpid()),
      },
      enable_import_completion = true,
      organize_imports_on_format = true,
    })

    lsp_zero.setup()
  end,
}
