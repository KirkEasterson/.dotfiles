return {
	'rmagatti/auto-session',
	commit = "63984ed9c0fb7eae61eb1c2982bc1147e202d23e", -- temp fix until telescope fix is merged
	cmd = {
		"Autosession",
		"DeleteSession",
		"RestoreSession",
		"SaveSession",
	},
	opts = {
		log_level = 'error',
		auto_save_enabled = true,
		auto_restore_enabled = false,
		auto_session_use_git_branch = true,
		pre_save_cmds = {
			"NvimTreeClose",
		},
	},
	init = function()
		local session_opts = {
			"buffers",
			"curdir",
			"folds",
			"localoptions",
			"tabpages",
			"terminal",
			"winpos",
			"winsize",
		}
		vim.o.sessionoptions = table.concat(session_opts, ",")
	end,
}
