return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		'nvim-telescope/telescope.nvim',
	},
	keys = {
		{ '<leader>re',  function() require('refactoring').refactor('Extract Function') end,         mode = { 'v' } },
		{ '<leader>rf',  function() require('refactoring').refactor('Extract Function To File') end, mode = { 'v' } },
		{ '<leader>rv',  function() require('refactoring').refactor('Extract Variable') end,         mode = { 'v' } },
		{ '<leader>ri',  function() require('refactoring').refactor('Inline Variable') end,          mode = { 'n', 'v' } },
		{ '<leader>rb',  function() require('refactoring').refactor('Extract Block') end },
		{ '<leader>rbf', function() require('refactoring').refactor('Extract Block To File') end },
		{ '<leader>rr',  function() require('telescope').extensions.refactoring.refactors() end,     mode = { 'n', 'v' } },
		{ '<leader>rp',  function() require('refactoring').debug.printf() end },
		{ '<leader>rP',  function() require('refactoring').debug.printf({ below = false }) end },
		{ '<leader>rv',  function() require('refactoring').debug.print_var({ normal = true }) end },
		{ '<leader>rv',  function() require('refactoring').debug.print_var() end,                    mode = { 'v' } },
		{ '<leader>rc',  function() require('refactoring').debug.cleanup() end,                    mode = { 'v' } },
	},
	opts = {
	},
	config = function(_, opts)
		require('refactoring').setup(opts)
		require("telescope").load_extension("refactoring")
	end
}
