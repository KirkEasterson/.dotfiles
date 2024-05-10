return {
  "JoosepAlviste/nvim-ts-context-commentstring",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  event = {
    "BufNewFile",
    "BufReadPost",
  },
  opts = {
    enable_autocmd = false,
  },
  init = function()
    -- disable backward compatability for more speed
    vim.g.skip_ts_context_commentstring_module = true
  end,
}
