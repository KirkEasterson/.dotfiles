vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

require('auto-session').setup(
	{
		auto_save_enabled = true,
		auto_restore_enabled = true,
		auto_session_use_git_branch = true,
		pre_save_cmds = {
			"NvimTreeClose",
		},

		cwd_change_handling = {
			post_cwd_changed_hook = function()
				require("lualine").refresh()
			end,
		},
	}
)
