vim.schedule(function()
  vim.pack.add({
    -- ALREADY LOADED DEPENDENCIES
    -- "https://github.com/williamboman/mason.nvim",

    "https://github.com/stevearc/conform.nvim",
    "https://github.com/zapling/mason-conform.nvim",
  })

  require("conform").setup({
    formatters_by_ft = {
      markdown = { "prettier" },
      typst = { "typstyle", lsp_format = "prefer" },
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
end)
