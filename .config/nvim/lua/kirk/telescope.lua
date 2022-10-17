local previewers = require("telescope.previewers")
local sorters = require("telescope.sorters")

require('telescope').setup {
	defaults = {
		color_devicons = true,
		file_previewer = previewers.vim_buffer_cat.new,
		file_sorter = sorters.get_fzy_sorter,
		grep_previewer = previewers.vim_buffer_vimgrep.new,
		qflist_previewer = previewers.vim_buffer_qflist.new,
		sorting_strategy = "ascending",
		layout_config = {
			prompt_position = 'top',
		},
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
		vimgrep_arguments = {
			"rg",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--hidden",
			"--max-depth=99"
		}
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
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
		},
	},
}

require("telescope").load_extension("fzy_native")
require("telescope").load_extension("git_worktree")
