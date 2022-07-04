require('nvim-tree').setup {
	view = {
		-- side = "right",
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
	}
}

-- adjust the offset for barbar
local nvim_tree_events = require('nvim-tree.events')
local bufferline_state = require('bufferline.state')

nvim_tree_events.on_tree_open(function()
	bufferline_state.set_offset(31, "File Tree")
end)

nvim_tree_events.on_tree_close(function()
	bufferline_state.set_offset(0)
end)
