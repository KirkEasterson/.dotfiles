return {
  "lewis6991/gitsigns.nvim",
  version = "v0.6", -- TODO: find out why 0.7 didn't work
  event = {
    "BufNewFile",
    "BufReadPost",
  },
  cmd = {
    "Gitsigns",
  },
  keys = {
    -- {
    -- 	"<leader>bt",
    -- 	function ()
    -- 		require("gitsigns").toggle_current_line_blame()
    -- 	end,
    -- 	desc = "Toggle git line blame",
    -- },
    {
      "[c",
      function()
        require("gitsigns").prev_hunk()
      end,
      desc = "Prev hunk",
    },
    {
      "]c",
      function()
        require("gitsigns").next_hunk()
      end,
      desc = "Next hunk",
    },
  },
  opts = {
    current_line_blame = false,
    current_line_blame_formatter = " 󰊢 <author>  <author_time:%d %b %Y>  <summary>",
    attach_to_untracked = false,
    -- linehl = true,
    -- word_diff = true,
    signs = {
      add = { text = "┃" },
      change = { text = "┃" },
      changedelete = { text = "┃" },
      delete = { text = "┃" },
      topdelete = { text = "┃" },
      untracked = { text = "┃" },
    },
    current_line_blame_opts = {
      delay = 10,
    },
  },
}
