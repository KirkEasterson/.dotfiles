require'nvim-treesitter.configs'.setup {
  ensure_installed = {
	  "go",
	  "gomod",
	  "gowork",
	  "typescript",
	  "python",
	  "lua",
	  "rust",
	  "bash",
	  "bibtex",
	  "css",
	  "dockerfile",
	  "html",
	  "make",
	  "latex",
	  "vim",
	  "javascript"
  },
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
