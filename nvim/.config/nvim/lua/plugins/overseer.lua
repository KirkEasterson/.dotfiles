return {
	"stevearc/overseer.nvim",
	commit = "3047ede61cc1308069ad1184c0d447ebee92d749", -- TODO: not pin
	cmd = {
		"CompilerOpen",
		"CompilerToggleResults"
	},
	opts = {
		task_list = {
			direction = "bottom",
			min_height = 25,
			max_height = 25,
			default_detail = 1,
			bindings = { ["q"] = function() vim.cmd("OverseerClose") end },
		},
	},
}
