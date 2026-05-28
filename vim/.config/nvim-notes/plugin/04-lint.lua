vim.schedule(function()
  vim.pack.add({
    -- ALREADY LOADED DEPENDENCIES
    -- "https://github.com/williamboman/mason.nvim",

    "https://github.com/mfussenegger/nvim-lint",
    "https://github.com/rshkarin/mason-nvim-lint",
  })

  require("lint").linters_by_ft = {
    markdown = { "markdownlint", "vale" },
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
      "codespell",
      "shellcheck",
      "stylelint",
      "vale",
      "markdownlint",
    },
  })

  -- run once on start
  require("lint").try_lint()
end)
