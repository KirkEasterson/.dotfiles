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
	config = function(_, opts)
		vim.o.sessionoptions = "buffers,curdir,folds,tabpages,winsize,winpos,terminal,localoptions"
		require('auto-session').setup(opts)
	end
}
