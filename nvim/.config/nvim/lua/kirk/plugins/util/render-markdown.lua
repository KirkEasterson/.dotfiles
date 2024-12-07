return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "echasnovski/mini.icons",
  },
  cmd = {
    "RenderMarkdown",
  },
  opts = {
    file_types = {
      "copilot-chat",
    },
  },
}
