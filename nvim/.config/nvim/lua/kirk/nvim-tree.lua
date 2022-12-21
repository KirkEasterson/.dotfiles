require('nvim-tree').setup {
	sort_by = "case_sensitive",
	sync_root_with_cwd = true,
	disable_netrw = true,
	view = {
		adaptive_size = true,
		side = "right", -- this doesn't look good with barbar
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
