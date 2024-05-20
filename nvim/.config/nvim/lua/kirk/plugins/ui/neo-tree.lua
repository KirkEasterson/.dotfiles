return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",
  },
  cmd = "Neotree",
  keys = {
    {
      "<leader>e",
      function()
        vim.cmd([[Neotree]])
      end,
      desc = "File tree",
    },
  },
  opts = {},
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.opt.termguicolors = true
  end,
}
