return {
	"lewis6991/gitsigns.nvim",
	cond = function()
		local not_firenvim = not vim.g.started_by_firenvim
		local in_git_repo = true -- TODO: determine if in a git repo
		return not_firenvim and in_git_repo
	end,
	version = "v0.*",
	event = 'VimEnter',
	cmd = {
		"Gitsigns",
	},
	keys = {
		-- {
		-- 	"<leader>bt",
		-- 	function ()
		-- 		require("gitsigns").toggle_current_line_blame()
		-- 	end,
		-- 	desc = "Toggle git line blame",
		-- },
		{
			"[c",
			function()
				require("gitsigns").prev_hunk()
			end,
			desc = "Prev hunk",
		},
		{
			"]c",
			function()
				require("gitsigns").next_hunk()
			end,
			desc = "Next hunk",
		},
	},
	opts = {
		current_line_blame = false,
		current_line_blame_formatter = ' 󰊢 <author>  <author_time:%d %b %Y>  <summary>',
		attach_to_untracked = false,
		-- linehl = true,
		-- word_diff = true,
		signs = {
			add = { text = "│" },
			change = { text = "│" },
			topdelete = { text = "▔" },
			delete = { text = "▁" },
			changedelete = { text = "│" },
			untracked = { text = "" },
		},
		current_line_blame_opts = {
			delay = 10,
		},
	},
}
