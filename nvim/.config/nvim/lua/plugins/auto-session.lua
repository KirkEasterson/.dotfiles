return {
	"rmagatti/auto-session",
	cond = not vim.g.started_by_firenvim,
	dependencies = {
		-- "nvim-telescope/telescope.nvim",
	},
	cmd = {
		"Autosession",
		"SessionDelete",
		"SessionRestore",
		"SessionRestoreFromFile",
		"SessionSave",
	},
	keys = {
		-- telescope file helpers
		-- {
		-- 	"<leader>sl",
		-- 	function ()
		-- 		require("auto-session.session-lens").search_session()
		-- 	end,
		-- 	desc = "Find files",
		-- },
	},
	opts = {
		log_level = "error",
		auto_save_enabled = true,
		auto_restore_enabled = false,
		auto_session_use_git_branch = true,
		pre_save_cmds = {
			"NvimTreeClose",
		},
		-- session_lens = {
		-- 	load_on_setup = true,
		-- 	theme_conf = { border = true, },
		-- 	previewer = false,
		-- },
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
	end,
}
