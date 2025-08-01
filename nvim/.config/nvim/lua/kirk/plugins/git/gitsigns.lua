return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  cmd = {
    "Gitsigns",
  },
  keys = {
    {
      "<leader>bt",
      function()
        require("gitsigns").toggle_current_line_blame()
      end,
      desc = "Toggle git line blame",
    },
    {
      "[c",
      function()
        require("gitsigns").nav_hunk("prev")
      end,
      desc = "Prev hunk",
    },
    {
      "]c",
      function()
        require("gitsigns").nav_hunk("next", { wrap = true })
      end,
      desc = "Next hunk",
    },
    {
      "[C",
      function()
        require("gitsigns").nav_hunk("first")
      end,
      desc = "First hunk",
    },
    {
      "]C",
      function()
        require("gitsigns").nav_hunk("last")
      end,
      desc = "Last hunk",
    },
  },
  opts = {
    trouble = false,
    attach_to_untracked = false,
    linehl = false,
    numhl = false,
    -- word_diff = true,
    watch_gitdir = {
      follow_files = true,
    },

    signs = {
      add = { text = "┃" },
      change = { text = "┃" },
      changedelete = { text = "┃" },
      delete = { text = "┃" },
      topdelete = { text = "┃" },
      untracked = { text = "┃" },
    },

    signs_staged = {
      add = { text = "║" },
      change = { text = "║" },
      changedelete = { text = "║" },
      delete = { text = "║" },
      topdelete = { text = "║" },
    },

    current_line_blame = false,
    current_line_blame_opts = {
      delay = 10,
    },
    current_line_blame_formatter = function(name, blame_info)
      if blame_info.author == name then
        blame_info.author = "You"
      end

      local message = string.format(
        "%s  %s  %s",
        blame_info.author,
        os.date("%Y-%b-%d", blame_info.author_time),
        blame_info.summary
      )

      return { { "  " .. message, "GitSignsCurrentLineBlame" } }
    end,
  },
}
