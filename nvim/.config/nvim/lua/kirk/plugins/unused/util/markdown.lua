return {
  "ixru/nvim-markdown",
  enabled = false,
  ft = {
    "json",
    "markdown",
    "toml",
    "yaml",
    "yml",
  },
  opts = false,
  init = function()
    vim.g.vim_markdown_no_default_key_mappings = 1

    vim.g.vim_markdown_frontmatter = 1
    vim.g.vim_markdown_json_frontmatter = 1
    vim.g.vim_markdown_math = 1
    vim.g.vim_markdown_toml_frontmatter = 1
  end,
}
