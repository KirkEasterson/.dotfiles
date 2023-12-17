return {
	"rshkarin/mason-nvim-lint",
	version = "*",
	event = "VimEnter",
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-lint",
	},
	opts = {
		ensure_installed = {
			"actionlint",
			-- "ansible-lint",
			"cmakelint",
			"codespell",
			-- "commitlint",
			"cpplint",
			"editorconfig-checker",
			"eslint_d",
			"gitlint",
			-- "golangci-lint",
			"jsonlint",
			"luacheck",
			"markdownlint",
			"prettier",
			"pylint",
			"shellcheck",
			-- "stylelint", -- css
			-- "stylua",
			"yamllint",
		},
	},
}
