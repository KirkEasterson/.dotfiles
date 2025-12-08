return {
  "pwntester/octo.nvim",
  cmd = "Octo",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "echasnovski/mini.icons",
  },
  opts = {
    default_merge_method = "squash",
  },
  init = function()
    vim.treesitter.language.register("markdown", "octo")
  end,
}
