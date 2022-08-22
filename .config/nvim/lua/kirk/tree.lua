require('nvim-tree').setup {
	sync_root_with_cwd = true,
	view = {
		-- side = "right", -- this doesn't look good with barbar
	},
	renderer = {
		add_trailing = true,
		highlight_git = true,
		icons = {
			git_placement = 'signcolumn',
		},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
	},
	git = {
		ignore = false,
	},
	actions = {
		change_dir = {
			enable = false,
		},
	},
}

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<leader>t', '<Cmd>NvimTreeToggle<CR>', opts)
