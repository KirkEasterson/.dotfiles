return {
  "rshkarin/mason-nvim-lint",
  event = {
    "BufNewFile",
    "BufReadPost",
  },
  dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-lint",
  },
  opts = {
    ensure_installed = {
      "actionlint",
      "ansible-lint",
      "cmakelint",
      "codespell",
      "commitlint",
      "cpplint",
      "editorconfig-checker",
      "eslint_d",
      "gitlint",
      "golangci-lint",
      "jsonlint",
      "luacheck",
      "prettier",
      "pylint",
      "shellcheck",
      "stylelint", -- css
      "stylua",
      "yamllint",
      -- "markdownlint",
      -- "stylua",
    },
  },
}
