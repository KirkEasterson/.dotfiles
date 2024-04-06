return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
    "LazyGitConfig",
  },
  keys = {
    {
      "<leader>lg",
      function()
        require("lazygit").lazygit()
      end,
      desc = "Lazygit",
    },
  },
}
