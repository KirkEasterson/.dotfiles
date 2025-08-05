return {
  "ThePrimeagen/git-worktree.nvim",
  enabled = false,
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    {
      "<leader>gw",
      function()
        require("telescope").extensions.git_worktree.git_worktrees({
          path_display = {},
        })
      end,
      desc = "Git worktrees",
    },
    {
      "<leader>gW",
      function()
        require("telescope").extensions.git_worktree.create_git_worktree({
          path_display = {},
        })
      end,
      desc = "Create git worktree",
    },
  },
  opts = {
    clear_jumps_on_change = false, -- this is handled by auto-session
    update_on_change = false,
    -- update_on_new_worktree = update_on_new_worktree,
  },
  config = function(_, opts)
    require("git-worktree").setup(opts)
    require("telescope").load_extension("git_worktree")
  end,
}
