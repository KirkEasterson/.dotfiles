return {
	"rmagatti/auto-session",
	cond = not vim.g.started_by_firenvim,
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	cmd = {
		"Autosession",
		"SessionDelete",
		"SessionRestore",
		"SessionRestoreFromFile",
		"SessionSave",
	},
	keys = {
		{
			"<leader>sl",
			function ()
				require("auto-session.session-lens").search_session()
			end,
			desc = "Session lens",
		},
	},
	opts = {
		log_level = vim.log.levels.ERROR,
		auto_session_enable_last_session = false,
		auto_session_enabled = true,
		auto_session_create_enabled = true,
		auto_save_enabled = true,
		auto_restore_enabled = false,
		auto_session_use_git_branch = true,
		pre_save_cmds = {
			"NvimTreeClose",
		},
		session_lens = {
			load_on_setup = true,
			theme_conf = { border = true, },
			previewer = false,
		},
	},
	init = function()
		local session_opts = {
			"blank",
			"buffers",
			"curdir",
			"folds",
			"help",
			"localoptions",
			"tabpages",
			"terminal",
			"winpos",
			"winsize",
		}
		vim.o.sessionoptions = table.concat(session_opts, ",")
		-- vim.opt.sessionoptions:append("globals") -- TODO: use append, but see
		-- if it "overwrites" multiple entries
	end,
}
