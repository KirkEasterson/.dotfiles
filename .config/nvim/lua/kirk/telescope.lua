local previewers = require("telescope.previewers")
local sorters = require("telescope.sorters")

local util = require("util")

util.map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>")
util.map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>")
util.map("n", "<leader>fG", "<cmd>lua require('telescope.builtin').grep_string()<CR>")
util.map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>")
util.map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>")

require('telescope').setup{
	defaults = {
		file_sorter = sorters.get_fzy_sorter,
		file_previewer = previewers.vim_buffer_cat.new,
		grep_previewer = previewers.vim_buffer_vimgrep.new,
		qflist_previewer = previewers.vim_buffer_qflist.new,

		color_devicons = true,

		file_ignore_patterns = {"./node%_modules/*", "node%_modules", "^node%_modules/*", "node%_modules/*"},
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
	},
	pickers = {
		find_files = {
			hidden = true,
			theme = "dropdown",
		}
	}
}

require("telescope").load_extension("fzy_native")
-- require("telescope").load_extension("git_worktree")
