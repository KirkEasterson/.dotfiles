return {
  "JoosepAlviste/nvim-ts-context-commentstring",
  enabled = vim.fn.has("nvim-0.10.0") ~= 1,
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
