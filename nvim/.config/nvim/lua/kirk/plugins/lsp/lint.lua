return {
  "mfussenegger/nvim-lint",
  event = {
    "BufNewFile",
    "BufReadPost",
  },
  config = function()
    require("lint").linters_by_ft = {
      cpp = { "cpplint" },
      -- css = { "stylellint" },
      -- gitcommit = { "commitlint" },
      -- go = { "golangci-lint" },
      javascript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      json = { "jsonlint" },
      -- lua = { "stylua", "luacheck" },
      -- markdown = { "markdownlint" },
      python = { "pylint" },
      svelte = { "eslint_d" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
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
    })

    -- run once on start
    require("lint").try_lint()
  end,
}
