vim.pack.add({
  -- ALREADY LOADED DEPENDENCIES
  -- "https://github.com/williamboman/mason.nvim",

  "https://github.com/mfussenegger/nvim-lint",
  "https://github.com/rshkarin/mason-nvim-lint",
})

require("lint").linters_by_ft = {
  cpp = { "cpplint" },
  -- css = { "stylellint" },
  -- gitcommit = { "commitlint" },
  -- go = { "golangci-lint" },
  javascript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  json = { "jsonlint" },
  -- lua = { "stylua", "luacheck" },
  markdown = { "markdownlint", "vale" },
  python = { "pylint" },
  svelte = { "eslint_d" },
  terraform = { "tflint" },
  tf = { "tflint" },
  -- typescript = { "eslint_d" },
  -- typescriptreact = { "eslint_d" },
  yaml = { "yamllint" },
  -- ["yaml.ansible"] = { "ansible-lint" },
}

vim.api.nvim_create_autocmd({
  "BufEnter",
  "BufReadPost",
  "BufWritePost",
  "FocusGained",
  "InsertLeave",
  "TextChanged",
}, {
  group = vim.api.nvim_create_augroup("lint", {
    clear = true,
  }),
  callback = function()
    require("lint").try_lint()
  end,
  desc = "Lint",
})

-- TODO: make a PR to mason-nvim-lint to add the "BAD" linters
require("mason-nvim-lint").setup({
  ensure_installed = {
    "actionlint",
    "ansible_lint",
    "cmakelint",
    "codespell",
    -- "commitlint", -- BAD
    "cpplint",
    "editorconfig-checker",
    "eslint_d",
    -- "gitlint", -- BAD
    "golangcilint",
    "jsonlint",
    "luacheck",
    -- "prettier", -- BAD
    "pylint",
    "shellcheck",
    "stylelint",
    -- "stylua", -- BAD
    "vale",
    "yamllint",
    "markdownlint",
  },
})

-- run once on start
require("lint").try_lint()
