local previewers = require("telescope.previewers")
local sorters = require("telescope.sorters")

require('telescope').setup {
	defaults = {
		file_sorter = sorters.get_fzy_sorter,
		file_previewer = previewers.vim_buffer_cat.new,
		grep_previewer = previewers.vim_buffer_vimgrep.new,
		qflist_previewer = previewers.vim_buffer_qflist.new,

		color_devicons = false,

		file_ignore_patterns = {
			"%.a",
			"%.class",
			"%.mkv",
			"%.mp4",
			"%.o",
			"%.out",
			"%.pdf",
			"%.zip",
			"./node%_modules/*",
			".cache",
			".git/",
			"^node%_modules/*",
			"node%_modules",
			"node%_modules/*",
		},
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
			ignore_patterns = {
				"*.git/*",
				"*/tmp/*"
			},
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
