return {
  "stevearc/conform.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  cmd = {
    "ConformInfo",
  },
  keys = {
    {
      "<leader>oc",
      function()
        -- TODO: add "organize imports" for formatters that don't do this

        require("conform").format({
          lsp_fallback = true,
          async = true,
          timeout_ms = 1000,
        })
      end,
      desc = "Format",
      mode = { "n", "x", "v" }, -- TODO: get range formatting to work
    },
  },
  opts = {
    formatters_by_ft = {
      -- ocaml = { "ocamlformat" },
      ["terraform-vars"] = { "tflint" },
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
      terraform = { "tflint" },
      tf = { "tflint" },
      typescript = { "prettierd", "prettier", "eslint_d" },
      typescriptreact = { "prettierd", "prettier", "eslint_d" },
      yaml = { "yamlfmt", "prettier" },
      zig = { "zigfmt" },
      zsh = { "shfmt" },
    },
  },
}
