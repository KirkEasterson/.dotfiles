vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = false,
  float = {
    border = "rounded",
  },
  inlay_hints = {
    enabled = false,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅘",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "󰌶",
    },
  },
})
