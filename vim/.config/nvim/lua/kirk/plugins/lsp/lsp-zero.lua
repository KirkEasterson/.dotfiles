-- TODO:: remove <C-w>d and <C-w><C-d> mapping for diagnostics under cursor
return {
  "VonHeikemen/lsp-zero.nvim",
  event = "VeryLazy",
  dependencies = {
    -- LSP Support
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- "jose-elias-alvarez/null-ls.nvim",
    -- "jay-babu/mason-null-ls.nvim",

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
  keys = {
    -- -- https://github.com/VonHeikemen/lsp-zero.nvim#keybindings
    {
      "<leader>rn",
      function()
        vim.lsp.buf.rename()
      end,
      desc = "Rename",
    },
    {
      "ga",
      function()
        vim.lsp.buf.code_action()
      end,
      desc = "Code actions",
    },
    {
      "gl",
      function()
        vim.diagnostic.open_float()
      end,
      desc = "Show diagnostics",
    },
  },
  opts = {},
  config = function(_, opts)
    local lsp_zero = require("lsp-zero")

    require("mason-lspconfig").setup({
      automatic_enable = false,
      automatic_installation = true,
      ensure_installed = {
        "ansiblels",
        "bashls",
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
        "html",
        "jsonls",
        "lemminx", -- xml
        "lua_ls",
        "omnisharp",
        "prismals",
        "protols",
        "pyright",
        "rust_analyzer",
        "sqlls",
        "svelte",
        "taplo", -- toml
        "terraformls",
        "tflint",
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
      handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
          require("lspconfig").lua_ls.setup(lsp_zero.nvim_lua_ls({
            settings = {
              Lua = {
                runtime = {
                  version = "LuaJIT",
                },
                workspace = {
                  checkThirdParty = false,
                },
                telemetry = {
                  enable = false,
                },
              },
            },
          }))
        end,
      },
    })

    local on_attach = function(client, bufnr)
      lsp_zero.default_keymaps({
        buffer = bufnr,
        preserve_mappings = false,
        exclude = {
          "<F2>",
          "<F3>",
          "<F4>",
          "<F5>",
        },
      })

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

    lsp_zero.set_sign_icons({
      error = "󰅘",
      hint = "󰌶",
      info = "",
      warn = "",
    })

    -- semantic tokens should be less than treesitter
    vim.highlight.priorities.semantic_tokens = 95

    lsp_zero.setup()
  end,
}
