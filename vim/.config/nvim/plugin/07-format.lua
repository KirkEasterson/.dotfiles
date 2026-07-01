vim.schedule(function()
  vim.pack.add({
    -- ALREADY LOADED DEPENDENCIES
    -- "https://github.com/williamboman/mason.nvim",

    { src = "https://github.com/stevearc/conform.nvim", version = vim.version.range("*") },
    { src = "https://github.com/zapling/mason-conform.nvim", version = vim.version.range("*") },
  })

  require("conform").setup({
    formatters_by_ft = {
      -- ocaml = { "ocamlformat" }, -- TODO: fix installation issues with this
      c = { "clang_format" },
      c_sharp = { "csharpier" },
      cpp = { "clang_format" },
      css = { "prettier" },
      go = { "gofumpt", "goimports" }, -- TODO: add "golines"
      hcl = { "hclfmt" },
      html = { "prettier" },
      javascript = { "prettierd", "prettier", "eslint_d" },
      javascriptreact = { "prettierd", "prettier", "eslint_d" },
      json = { "prettier" },
      ["json5"] = { "prettier" },
      jsonc = { "prettier" },
      lua = { "stylua" },
      markdown = { "prettier" },
      rego = { "opa_fmt" },
      python = { "black" },
      rust = { "rustfmt" },
      sh = { "shfmt" },
      terraform = { "terraform" },
      ["terraform-vars"] = { "terraform" },
      tf = { "terraform" },
      typescript = { "biome", "biome-check", "biome-organize-imports" },
      typescriptreact = { "biome", "biome-check", "biome-organize-imports" },
      typst = { "typstyle", lsp_format = "prefer" },
      yaml = { "yamlfmt", "prettier" },
      zig = { "zigfmt" },
      zsh = { "shfmt" },
    },
  })

  vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

  require("mason-conform").setup()

  vim.keymap.set({ "n", "x", "v" }, "<leader>oc", function()
    require("conform").format({
      lsp_fallback = true,
      async = true,
      timeout_ms = 1000,
    })
  end, { desc = "Format" })
end)
