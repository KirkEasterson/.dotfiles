return {
	'rmagatti/auto-session',
	cmd = {
		"SaveSession",
		"RestoreSession",
		"DeleteSession",
		"Autosession",
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
}
