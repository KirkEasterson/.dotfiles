return {
  "mg979/vim-visual-multi",
  enabled = false,
  lazy = false,
  keys = {
    -- https://github.com/mg979/vim-visual-multi/wiki/Mappings#permanent-mappings
    {
      "<C-n>",
      desc = "mulicursor - add word under cursor",
    },
    {
      "<Leader>A",
      desc = "mulicursor - select entire file",
    },
    {
      "<Leader>/",
      desc = "mulicursor - start regex search",
    },
  },
  config = false,
  init = function()
    vim.g.VM_leader = vim.g.mapleader
    vim.g.VM_default_mappings = 0
  end,
}
