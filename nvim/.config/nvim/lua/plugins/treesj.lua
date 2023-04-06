return {
	'Wansmer/treesj',
	dependencies = {
		'nvim-treesitter/nvim-treesitter'
	},
	cmd = {
		"TSJToggle",
		"TSJSplit",
		"TSJJoin",
	},
	keys = {
		{ '<leader>J', function() require('treesj').toggle() end },
	},
	opts = {
		use_default_keymaps = false,
		langs = {
			"javascript",
			"jsx",
			"typescript",
			"tsx",
			"lua",
			"CSS",
			"SCSS",
			"HTML",
			"JSON",
			"JSONC",
			"toml",
			"yaml",
			"python",
			"go",
			"java",
			"rust",
			"C",
			"C++",
			"C/C++",
			"nix",
			"kotlin",
		},
	},
}
