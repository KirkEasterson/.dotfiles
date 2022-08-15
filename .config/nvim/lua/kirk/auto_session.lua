vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

require('auto-session').setup(
	{
		auto_session_use_git_branch = true,
	}
)
