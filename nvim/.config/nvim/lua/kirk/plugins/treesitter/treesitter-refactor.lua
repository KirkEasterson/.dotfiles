return {
	"nvim-treesitter/nvim-treesitter-refactor",
	cond = not vim.g.started_by_firenvim,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	main = "nvim-treesitter.configs",
	event = "VimEnter",
	opts = {
		refactor = {
			highlight_current_scope = {
				enable = false,
			},
			highlight_definitions = {
				enable = true,
				clear_on_cursor_move = false,
			},
			-- smart_rename = {
			-- 	enable = true,
			-- 	keymaps = {
			-- 		smart_rename = "<leader>rn",
			-- 	},
			-- },
		},
	},
}
