return {
	"jay-babu/mason-null-ls.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"jose-elias-alvarez/null-ls.nvim",
	},
	event = "VeryLazy",
	opts = {
		automatic_installation = true,
		automatic_setup = true,
		ensure_installed = {
			"autopep8",
			"flake8",
			"pylint",
			"black",
			"eslint_d",
			"stylelint",
			"protoc_gen_lint",
			"buf",
			"hadolint",
			"markdownlint",
			"terraform_validate",
			"proselint",
			"commitlint",
			"prettier",
			"gofumpt",
		},
	},
	config = function(_, opts)
		require('mason-null-ls').setup(opts)
	end
}
