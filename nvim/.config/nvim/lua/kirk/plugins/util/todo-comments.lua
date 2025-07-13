return {
  "folke/todo-comments.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- "nvim-telescope/telescope.nvim",
  },
  event = "VeryLazy",
  cmd = {
    "TodoLocList",
    "TodoQuickFix",
    "TodoTelescope",
    "TodoTrouble",
  },
  -- keys = { -- uncomment if used
  -- 	{
  -- 		"<leader>DT",
  -- 		vim.cmd.TodoTelescope,
  -- 		desc = "View TODOs",
  -- 	},
  -- },
  opts = {
    signs = false,
  },
}
