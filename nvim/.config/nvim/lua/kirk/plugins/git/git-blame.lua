return {
  "f-person/git-blame.nvim",
  enabled = false,
  cmd = {
    "GitBlameCopyCommitURL",
    "GitBlameCopyFileURL",
    "GitBlameCopySHA",
    "GitBlameDisable",
    "GitBlameEnable",
    "GitBlameOpenCommitURL",
    "GitBlameOpenFileURL",
    "GitBlameToggle",
  },
  keys = {
    {
      "<leader>bt",
      vim.cmd.GitBlameToggle,
      desc = "Toggle git line blame",
    },
  },
  opts = {
    enabled = false,
    delay = 1,
    message_template = "  <author>  <date>  <summary>",
    date_format = "%d %b %Y",
    message_when_not_committed = "  Not Committed Yet",
    set_extmark_options = {
      hl_mode = "combine",
    },
  },
}
