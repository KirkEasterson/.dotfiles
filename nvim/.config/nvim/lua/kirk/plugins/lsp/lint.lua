return {
  "mfussenegger/nvim-lint",
  event = {
    "BufEnter",
    "BufReadPost",
    "BufWritePost",
    "FocusGained",
    "InsertLeave",
    "TextChanged",
    "TextChanged",
  },
  config = function()
    require("lint").linters_by_ft = {
      -- ansible = { "ansible-lint" },
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
    }

    local global_linters = {
      "actionlint",
      "codespell",
    }

    vim.api.nvim_create_autocmd({
      "BufEnter",
      "BufReadPost",
      "BufWritePost",
      "FocusGained",
      "InsertLeave",
      "TextChanged",
      "TextChanged",
    }, {
      group = vim.api.nvim_create_augroup("lint", {
        clear = true,
      }),
      callback = function()
        require("lint").try_lint()

        -- run global linters
        for ft, _ in pairs(global_linters) do
          -- pcall(require("lint").try_lint, global_linters[ft])
        end
      end,
    })

    -- run once on start
    require("lint").try_lint()
  end,
}
