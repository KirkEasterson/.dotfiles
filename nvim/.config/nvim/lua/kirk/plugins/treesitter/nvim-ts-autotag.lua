return {
  "windwp/nvim-ts-autotag",
  -- enabled = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  main = "nvim-treesitter.configs",
  ft = {
    "astro",
    "glimmer",
    "handlebars",
    "hbs",
    "html",
    "javascript",
    "javascriptreact",
    "jsx",
    "markdown",
    "php",
    "rescript",
    "svelte",
    "tsx",
    "typescript",
    "typescriptreact",
    "vue",
    "xml",
  },
  opts = {
    autotag = {
      enable = true,
    },
  },
}
