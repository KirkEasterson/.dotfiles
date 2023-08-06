return {
	"lewis6991/gitsigns.nvim",
	cond = not vim.g.started_by_firenvim,
	event = "VeryLazy",
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
	},
	opts = {
		signs = {
			add = { text = "▌", },
			change = { text = "▌", },
			topdelete = { text = "▔", },
			delete = { text = "▁", },
			changedelete = { text = "▁", },
			untracked = { text = "▌", },
		},
		current_line_blame_opts = {
			delay = 10,
		},
	},
}
