return {
	'rmagatti/auto-session',
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
}
