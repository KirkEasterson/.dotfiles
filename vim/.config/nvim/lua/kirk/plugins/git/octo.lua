return {
  "pwntester/octo.nvim",
  cmd = "Octo",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "folke/snacks.nvim",
    "echasnovski/mini.icons",
  },
  opts = {
    default_merge_method = "squash",
    picker = "snacks",
  },
  init = function()
    vim.treesitter.language.register("markdown", "octo")
  end,
}
