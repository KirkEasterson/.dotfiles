return {
  "neovim/nvim-lspconfig",
  cond = not vim.g.started_by_firenvim,
  event = "VimEnter",
  cmd = {
    "LspInfo",
    "LspLog",
    "LspRestart",
    "LspStart",
    "LspStop",
  },
  config = function(_, opts)
    require("lspconfig.ui.windows").default_options.border = "rounded"
    vim.diagnostic.config({
      virtual_text = false,
      float = {
        border = "rounded",
      },
    })
  end,
}
