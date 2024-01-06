return {
  "nvimtools/none-ls.nvim",
  enabled = false,
  cond = not vim.g.started_by_firenvim,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "VimEnter",
  main = "null-ls",
  cmd = {
    "NullLsInfo",
    "NullLsLog",
  },
  config = function()
    null_ls = require("null-ls")
    null_ls.setup({
      border = "rounded",
      sources = {
        -- python
        -- null_ls.builtins.code_actions.pyright, -- TODO: find code_actions for python
        null_ls.builtins.diagnostics.pylint, -- TODO: experiment with ruff
        null_ls.builtins.formatting.autopep8,
        -- null_ls.builtins.formatting.black,

        -- -- lua
        null_ls.builtins.formatting.stylua,

        -- js/ts
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.code_actions.eslint,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.code_actions.eslint,

        -- styling
        null_ls.builtins.diagnostics.stylelint,

        -- proto buffs
        null_ls.builtins.diagnostics.protoc_gen_lint,
        null_ls.builtins.formatting.buf,

        -- docker
        null_ls.builtins.diagnostics.hadolint,

        -- markdown
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.formatting.markdownlint,
        null_ls.builtins.code_actions.proselint,

        -- terraform
        null_ls.builtins.diagnostics.terraform_validate,
        null_ls.builtins.diagnostics.tfsec,

        -- general utility
        null_ls.builtins.code_actions.refactoring,
        null_ls.builtins.diagnostics.todo_comments,
        -- null_ls.builtins.diagnostics.editorconfig_checker, -- this got annoying from long line errors
        -- null_ls.builtins.diagnostics.trail_space, -- redundant with autocommand
        null_ls.builtins.diagnostics.dotenv_linter,

        -- golang
        -- null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.diagnostics.golangci_lint,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.code_actions.gomodifytags,

        -- ocaml
        -- null_ls.builtins.formatting.ocamlformat, -- TODO: figure out why this doesn't install

        -- git
        null_ls.builtins.diagnostics.actionlint,

        -- ansible
        null_ls.builtins.diagnostics.ansiblelint,
        null_ls.builtins.diagnostics.commitlint,
      },
    })
  end,
}
