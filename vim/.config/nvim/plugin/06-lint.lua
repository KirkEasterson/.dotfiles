vim.pack.add({
  -- ALREADY LOADED DEPENDENCIES
  -- "https://github.com/williamboman/mason.nvim",

  "https://github.com/mfussenegger/nvim-lint",
  -- "https://github.com/rshkarin/mason-nvim-lint",
  {
    src = "https://github.com/kirkeasterson/mason-nvim-lint",
    version = "kirk_2026-05-16_07-44-08_add-commitlint-and-gitlint-mapping",
  },
})

require("lint").linters_by_ft = {
  cpp = { "cpplint" },
  css = { "stylelint" },
  gitcommit = { "commitlint", "codespell" },
  go = { "golangcilint" },
  javascript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  json = { "jsonlint" },
  lua = { "luacheck" },
  markdown = { "markdownlint", "vale" },
  python = { "pylint" },
  svelte = { "eslint_d" },
  terraform = { "terraform" },
  ["terraform-vars"] = { "terraform" },
  tf = { "terraform" },
  typescript = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  yaml = { "yamllint" },
  ["yaml.ansible"] = { "ansible_lint" },
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

require("mason-nvim-lint").setup({
  ensure_installed = {
    "actionlint",
    "ansible_lint",
    "cmakelint",
    "codespell",
    "commitlint",
    "cpplint",
    "editorconfig-checker",
    "eslint_d",
    "gitlint",
    "golangcilint",
    "jsonlint",
    "luacheck",
    "pylint",
    "shellcheck",
    "stylelint",
    "terraform",
    "vale",
    "yamllint",
    "markdownlint",
  },
})

-- run once on start
require("lint").try_lint()
