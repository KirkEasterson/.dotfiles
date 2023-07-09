return {
	'ThePrimeagen/harpoon',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope.nvim',
	},
	keys = {
		{ '<leader>ha', function() require('harpoon.mark').add_file() end },
		{ '<leader>hm', function() require('harpoon.ui').toggle_quick_menu() end },
		{ '<leader>h1', function() require('harpoon.ui').nav_file(1) end },
		{ '<leader>h2', function() require('harpoon.ui').nav_file(2) end },
		{ '<leader>h3', function() require('harpoon.ui').nav_file(3) end },
		{ '<leader>h4', function() require('harpoon.ui').nav_file(4) end },
		{ "<leader>ht", "<Cmd>Telescope harpoon marks<CR>" },
	},
	opts = {},
	config = function(_, opts)
		require('harpoon').setup(opts)
		require("telescope").load_extension("harpoon")
	end
}
