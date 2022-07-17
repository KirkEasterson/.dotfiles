-- local ts_utils = require 'nvim-treesitter.ts_utils'

require 'nvim-treesitter.configs'.setup {
	ensure_installed = {
		"bash",
		"bibtex",
		"css",
		"dockerfile",
		"go",
		"gomod",
		"gowork",
		"html",
		"javascript",
		"json",
		"json5",
		"latex",
		"lua",
		"make",
		"markdown",
		"python",
		"regex",
		"rust",
		"tsx",
		"typescript",
		"vim",
		"yaml",
	},
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	}
}
