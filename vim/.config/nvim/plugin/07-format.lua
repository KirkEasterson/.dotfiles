vim.pack.add({
  -- ALREADY LOADED DEPENDENCIES
  -- "https://github.com/williamboman/mason.nvim",

  "https://github.com/stevearc/conform.nvim",
  "https://github.com/zapling/mason-conform.nvim",
})

require("conform").setup({
  formatters_by_ft = {
    -- ocaml = { "ocamlformat" },
    -- ["terraform-vars"] = { "tflint" },
    c = { "clang_format" },
    c_sharp = { "csharpier" },
    cpp = { "clang_format" },
    css = { "prettier" },
    go = { "gofumpt", "goimports" }, -- TODO: add "golines"
    -- hcl = { "packer_fmt" },
    html = { "prettier" },
    javascript = { "prettierd", "prettier", "eslint_d" },
    javascriptreact = { "prettierd", "prettier", "eslint_d" },
    json = { "prettier" },
    jsonc = { "prettier" },
    lua = { "stylua" },
    markdown = { "prettier" },
    python = { "black" },
    rust = { "rustfmt" },
    sh = { "shfmt" },
    -- terraform = { "tflint" },
    -- tf = { "tflint" },
    typescript = { "biome", "biome-check", "biome-organize-imports" },
    typescriptreact = { "biome", "biome-check", "biome-organize-imports" },
    typst = { "typstyle", lsp_format = "prefer" },
    yaml = { "yamlfmt", "prettier" },
    zig = { "zigfmt" },
    zsh = { "shfmt" },
  },
})

require("mason-conform").setup()

vim.keymap.set({ "n", "x", "v" }, "<leader>oc", function()
  require("conform").format({
    lsp_fallback = true,
    async = true,
    timeout_ms = 1000,
  })
end, { desc = "Format" })
