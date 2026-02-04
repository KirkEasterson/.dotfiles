return {
  "iamcco/markdown-preview.nvim",
  enabled = false,
  ft = { "markdown" },
  cmd = {
    "MarkdownPreview",
    "MarkdownPreviewStop",
    "MarkdownPreviewToggle",
  },
  keys = {
    {
      "<leader>mdp",
      vim.cmd.MarkdownPreview,
      desc = "Preview markdown",
    },
    {
      "<leader>mds",
      vim.cmd.MarkdownPreviewStop,
      desc = "Stop markdown preview",
    },
    {
      "<leader>mdt",
      vim.cmd.MarkdownPreviewToggle,
      desc = "Toggle markdown preview",
    },
  },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  init = function()
    vim.g.mkdp_auto_close = 1
  end,
}
