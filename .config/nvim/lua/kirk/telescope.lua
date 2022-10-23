local telescope = require("telescope")
local previewers = require("telescope.previewers")
local sorters = require("telescope.sorters")

telescope.setup {
	defaults = {
		color_devicons = true,
		entry_prefix = "  ",
		file_previewer = previewers.vim_buffer_cat.new,
		file_sorter = sorters.get_fzy_sorter,
		grep_previewer = previewers.vim_buffer_vimgrep.new,
		prompt_prefix = "   ",
		qflist_previewer = previewers.vim_buffer_qflist.new,
		selection_caret = "  ",
		sorting_strategy = "ascending",
		layout_config = {
			prompt_position = 'top',
			preview_width = 0.6,
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
			"packer_compiled.lua",
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
		},
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

vim.cmd([[autocmd User TelescopePreviewerLoaded setlocal number]])

telescope.load_extension("fzy_native")
telescope.load_extension("git_worktree")
-- telescope.load_extension("noice")
