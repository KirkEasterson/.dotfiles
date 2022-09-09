-- local ts_utils = require 'nvim-treesitter.ts_utils'

require 'nvim-treesitter.configs'.setup {
	ensure_installed = "all",
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	}
}

require("nvim-treesitter.install").prefer_git = true

require('treesitter-context').setup{}
