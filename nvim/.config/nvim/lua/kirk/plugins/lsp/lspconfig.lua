-- TODO:: remove <C-w>d and <C-w><C-d> mapping for diagnostics under cursor
return {
  "neovim/nvim-lspconfig",
  event = {
    "BufNewFile",
    "BufReadPost",
  },
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
