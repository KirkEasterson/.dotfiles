return {
  "kdheepak/lazygit.nvim",
  enabled = false,
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
