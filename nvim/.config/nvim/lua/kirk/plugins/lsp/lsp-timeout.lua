return {
  "hinell/lsp-timeout.nvim",
  enabled = false,
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  event = "VeryLazy",
  config = function(_, opts)
    vim.g["lsp-timeout-config"] = {
      stopTimeout = 1000 * 60 * 5, -- wait ms before stopping all LSP servers
      startTimeout = 1000 * 10, -- ms before restart
      silent = false, -- true to suppress notifications
    }
  end,
}
