-- TODO:: remove <C-w>d and <C-w><C-d> mapping for diagnostics under cursor
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "saghen/blink.cmp",
    "antosha417/nvim-lsp-file-operations",
  },
  event = "UIEnter",
  cmd = {
    "LspInfo",
    "LspLog",
    "LspRestart",
    "LspStart",
    "LspStop",
  },
  keys = {
    {
      "gd",
      function()
        vim.lsp.buf.definition()
      end,
      desc = "Go to definition",
    },
    {
      "gD",
      function()
        vim.lsp.buf.declaration()
      end,
      desc = "Go to declaration",
    },
    {
      "gi",
      function()
        vim.lsp.buf.implementation()
      end,
      desc = "Go to implementation",
    },
    {
      "go",
      function()
        vim.lsp.buf.type_definition()
      end,
      desc = "Go to type definition",
    },
    {
      "gr",
      function()
        vim.lsp.buf.references()
      end,
      desc = "Go to reference",
    },
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
  config = function()
    -- semantic tokens should be less than treesitter
    vim.highlight.priorities.semantic_tokens = 95

    require("lspconfig.ui.windows").default_options.border = "rounded"

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

    vim.lsp.enable({ "lua_ls" })
  end,
}
