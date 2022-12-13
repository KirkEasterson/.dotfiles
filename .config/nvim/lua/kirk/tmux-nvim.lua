require('tmux').setup({
	copy_sync = {
		enable = false,
		redirect_to_clipboard = true,
	},
	resize = {
		enable_default_keybindings = true,
		resize_step_x = 8,
		resize_step_y = 4,
	},
})
