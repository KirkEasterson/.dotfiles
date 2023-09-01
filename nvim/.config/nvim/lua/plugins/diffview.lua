return {
	'sindrets/diffview.nvim',
	cond = not vim.g.started_by_firenvim,
	-- enabled = false,
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	cmd = {
		'DiffviewClose',
		'DiffviewFileHistory',
		'DiffviewFocusFiles',
		'DiffviewOpen',
		'DiffviewRefresh',
		'DiffviewToggleFiles',
	},
	config = function()
		require('diffview').setup({
			enhanced_diff_hl = true,
			view = {
				merge_tool = {
					winbar_info = false,
				},
			},
			keymaps = {
				file_panel = {
					{ "n", "<c-u>", require("diffview.actions").scroll_view(-0.1), { desc = "Scroll the view up" } },
					{ "n", "<c-d>", require("diffview.actions").scroll_view(0.1),  { desc = "Scroll the view down" } },
				},
				file_history_panel = {
					{ "n", "<c-u>", require("diffview.actions").scroll_view(-0.1), { desc = "Scroll the view up" } },
					{ "n", "<c-d>", require("diffview.actions").scroll_view(0.1),  { desc = "Scroll the view down" } },
				},
			},
		})
	end,
}
