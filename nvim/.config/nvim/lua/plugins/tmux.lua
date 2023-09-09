return {
	'aserowy/tmux.nvim',
	cond = not vim.g.started_by_firenvim,
	-- enabled = false,
	event = 'VimEnter',
	opts = {
		copy_sync = {
			enable = true,
			redirect_to_clipboard = true,
		},
		resize = {
			enable_default_keybindings = true,
			resize_step_x = 8,
			resize_step_y = 4,
		},
	},
}
