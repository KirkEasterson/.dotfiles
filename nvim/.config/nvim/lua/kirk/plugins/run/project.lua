return {
  "ahmedkhalf/project.nvim",
  enabled = false,
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    {
      "<leader>fo",
      function()
        require("telescope").extensions.projects.projects()
      end,
      desc = "Find projects",
    },
  },
  opts = {
    detection_methods = { "lsp" },
    patterns = {
      ".bzr",
      ".git",
      ".hg",
      ".sln",
      ".svn",
      "Makefile",
      "_darcs",
      "go.mod",
      "package.json",
    },
  },
  config = function(_, opts)
    require("project_nvim").setup(opts)
    require("telescope").load_extension("dap")
  end,
}
