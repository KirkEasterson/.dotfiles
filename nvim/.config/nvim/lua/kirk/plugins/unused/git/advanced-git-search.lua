return {
  "aaronhallaert/advanced-git-search.nvim",
  enabled = false,
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "sindrets/diffview.nvim",
    "tpope/vim-fugitive", -- to show diff splits and open commits in browser
    "tpope/vim-rhubarb", -- to open commits in browser with fugitive
  },
  cmd = {
    "AdvancedGitSearch",
  },
  opts = {
    extensions = {
      advanced_git_search = {
        diff_plugin = "diffview",
        show_builtin_git_pickers = true,
      },
    },
  },
  config = function(_, opts)
    -- optional: setup telescope before loading the extension
    require("telescope").setup({
      -- move this to the place where you call the telescope setup function
      extensions = {
        advanced_git_search = opts,
      },
    })

    require("telescope").load_extension("advanced_git_search")
  end,
}
