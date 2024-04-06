return {
  "iamcco/markdown-preview.nvim",
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
    -- vim.api.nvim_set_var("mkdp_auto_start", 1)
    -- vim.api.nvim_set_var("mkdp_echo_preview_url", 1)
    vim.api.nvim_set_var("mkdp_auto_close", 0)
  end,
}
