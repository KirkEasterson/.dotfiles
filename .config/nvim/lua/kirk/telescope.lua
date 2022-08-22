local previewers = require("telescope.previewers")
local sorters = require("telescope.sorters")

local util = require("util")

util.map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>")
util.map("n", "<leader>FF", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>")
util.map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>")
util.map("n", "<leader>fG", "<cmd>lua require('telescope.builtin').grep_string()<CR>")
util.map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>")
-- util.map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>")
util.map("n", "<leader>fr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>")
util.map("n", "<leader>fs", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>")
util.map("n", "<leader>ft", "<cmd>lua require('telescope.builtin').treesitter()<CR>")

util.map("n", "<leader>gb", "<cmd>lua require('telescope.builtin').git_branches()<CR>")
util.map("n", "<leader>gc", "<cmd>lua require('telescope.builtin').git_commits()<CR>")
util.map("n", "<leader>bc", "<cmd>lua require('telescope.builtin').git_bcommits()<CR>")

util.map("n", "<leader>rr", "<cmd>lua require('telescope.builtin').registers()<CR>")

util.map("n", "<leader>dd", "<cmd>lua require('telescope.builtin').diagnostics()<CR>")

util.map("n", "<leader>gw", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
util.map("n", "<leader>gW", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>")


require('telescope').setup {
	defaults = {
		file_sorter = sorters.get_fzy_sorter,
		file_previewer = previewers.vim_buffer_cat.new,
		grep_previewer = previewers.vim_buffer_vimgrep.new,
		qflist_previewer = previewers.vim_buffer_qflist.new,

		color_devicons = true,

		file_ignore_patterns = { "./node%_modules/*", "node%_modules", "^node%_modules/*", "node%_modules/*" },
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		frecency = {
			show_scores = false,
			show_unindexed = true,
			ignore_patterns = { "*.git/*", "*/tmp/*" },
		},
	},
	pickers = {
		find_files = {
			hidden = true,
			theme = "dropdown",
		},
	}
}

-- require("telescope").load_extension("fzf")
require("telescope").load_extension("fzy_native")
-- require('telescope').load_extension('frecency')
require("telescope").load_extension("git_worktree")
