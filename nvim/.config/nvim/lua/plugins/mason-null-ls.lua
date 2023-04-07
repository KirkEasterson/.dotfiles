return {
	"jay-babu/mason-null-ls.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"jose-elias-alvarez/null-ls.nvim",
	},
	opts = {
		automatic_installation = true,
		automatic_setup = true,
		ensure_installed = {
			"autopep8",
			"flake8",
			"pylint",
			"black",
			"eslint_d",
			"prettier",
			"gofumpt",
		},
	},
	config = function(_, opts)
		require('mason-null-ls').setup(opts)
		require('mason-null-ls').setup_handlers()
	end
}
