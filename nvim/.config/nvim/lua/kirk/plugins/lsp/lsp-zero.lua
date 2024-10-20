-- TODO:: remove <C-w>d and <C-w><C-d> mapping for diagnostics under cursor
return {
  "VonHeikemen/lsp-zero.nvim",
  dependencies = {
    -- LSP Support
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- "jose-elias-alvarez/null-ls.nvim",
    -- "jay-babu/mason-null-ls.nvim",

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
    -- { "K",    desc = "Hover info" },
    -- { "gd",   desc = "Definition" },
    -- { "gD",   desc = "Decleration" },
    -- { "gi",   desc = "List implementations" },
    -- { "go",   desc = "Type definition" },
    -- { "gr",   desc = "List references" },
    -- { "gs",   desc = "Display signature" },
    -- { "<F2>", desc = "Rename" },
    -- { "<F3>", desc = "Format" },
    -- { "<F4>", desc = "Code actions" },
    -- { "gl",   desc = "Show diagnostics" },
    -- { "[d",   desc = "Previous diagnostic" },
    -- { "]d",   desc = "Next diagnostic" },
  },
  opts = {},
  config = function(_, opts)
    local lsp_zero = require("lsp-zero")

    require("mason-lspconfig").setup({
      automatic_installation = true,
      ensure_installed = {
        "ansiblels",
        "bashls",
        "clangd",
        "cmake",
        "csharp_ls",
        "cssls",
        "docker_compose_language_service",
        "dockerls",
        "eslint",
        "golangci_lint_ls",
        "gopls",
        "html",
        "jsonls",
        "lemminx", -- xml
        "diagnosticls",
        "lua_ls",
        "omnisharp",
        "pyright",
        "rust_analyzer",
        "sqlls",
        "taplo", -- toml
        "terraformls",
        "tflint",
        "ts_ls",
        "vimls",
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
      })

      -- -- for ufo folding
      -- client.server_capabilities.textDocument = {
      --   foldingRange = {
      --     dynamicRegistration = false,
      --     lineFoldingOnly = true,
      --   },
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

    lsp_zero.configure("gopls", {
      settings = {
        gopls = {
          env = {
            GOFLAGS = "-tags=windows,linux,unittest,e2e",
          },
          -- buildFlags = { "-tags=windows,linux,unittest,e2e" },
        },
      },
    })

    lsp_zero.configure("jsonls", {
      ["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
        -- jsonls doesn't really support json5
        -- remove some annoying errors
        local opd = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {})
        if string.match(result.uri, "%.jsonc$", -6) and result.diagnostics ~= nil then
          local idx = 1
          while idx <= #result.diagnostics do
            -- "Comments are not permitted in JSON."
            if result.diagnostics[idx].code == 519 then
              table.remove(result.diagnostics, idx)
            else
              idx = idx + 1
            end
          end
        end
        opd(err, result, ctx, config)
      end,
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
