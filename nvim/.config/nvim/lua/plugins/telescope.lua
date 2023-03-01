return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope-fzy-native.nvim',
	},
	config = function()
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
				oldfiles = {
					cwd_only = true,
				}
			},
		}

		vim.api.nvim_create_autocmd({ "User" }, {
			pattern = "TelescopePreviewerLoaded",
			command = "setlocal number"
		})

		telescope.load_extension("fzy_native")
	end,
	keys = {
		-- telescope file helpers
		{ "<leader>ff", function() require('telescope.builtin').find_files() end },
		{ "<leader>fo", function() require('telescope.builtin').oldfiles() end },
		{ "<leader>FF", function() require('telescope.builtin').current_buffer_fuzzy_find() end },
		{ "<leader>fg", function() require('telescope.builtin').live_grep() end },
		{ "<leader>fG", function() require('telescope.builtin').grep_string() end },
		{ "<leader>fb", function() require('telescope.builtin').buffers() end },

		-- telescope lsp/treesitter helpers
		{ "<leader>fr", function() require('telescope.builtin').lsp_references() end },
		{ "<leader>fs", function() require('telescope.builtin').lsp_document_symbols() end },
		{ "<leader>ft", function() require('telescope.builtin').treesitter() end },
		{ "<leader>dd", function() require('telescope.builtin').diagnostics() end },

		-- telescope git helpers
		{ "<leader>gf", function() require('telescope.builtin').git_files() end },
		{ "<leader>gb", function() require('telescope.builtin').git_branches() end },
		{ "<leader>gc", function() require('telescope.builtin').git_commits() end },
		{ "<leader>bc", function() require('telescope.builtin').git_bcommits() end },

		-- telescope util helpers
		{ "<leader>fh", function() require('telescope.builtin').help_tags() end },
		{ "<leader>fk", function() require('telescope.builtin').keymaps() end },
		{ "<leader>fS", function() require('telescope.builtin').spell_suggest() end },
		-- {"<leader>rr", function() require('telescope.builtin').registers() end},
	},
}
