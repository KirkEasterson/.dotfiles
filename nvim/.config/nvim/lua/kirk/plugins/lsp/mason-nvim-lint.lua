local get_ensure_installed = function()
  local util = require("util")

  -- TODO: maybe use ENV variables
  local base_linters = {
    "actionlint",
    "codespell",
    -- "commitlint",
    "editorconfig-checker",
    "eslint_d",
    "gitlint",
    -- "golangci-lint",
    "jsonlint",
    -- "markdownlint",
    "prettier",
    "pylint",
    "shellcheck",
    -- "stylelint", -- css
    -- "stylua",
    "yamllint",
  }

  if util.indocker() then
    return base_linters
  end

  return util.table_concat(base_linters, {
    -- "ansible-lint",
    "cmakelint",
    "cpplint",
    "luacheck",
  })
end

local ensure_installed = get_ensure_installed()

return {
  "rshkarin/mason-nvim-lint",
  version = "*",
  event = "UIEnter",
  dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-lint",
  },
  opts = {
    ensure_installed = ensure_installed,
  },
}
