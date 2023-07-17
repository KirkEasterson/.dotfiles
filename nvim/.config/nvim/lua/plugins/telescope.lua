return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- 'nvim-telescope/telescope-fzy-native.nvim',
		"nvim-telescope/telescope-fzf-native.nvim",
		"folke/trouble.nvim",
		"debugloop/telescope-undo.nvim",
	},
	cmd = {
		"Telescope",
	},
	config = function()
		local telescope = require("telescope")
		local previewers = require("telescope.previewers")
		local sorters = require("telescope.sorters")

		local trouble = require("trouble.providers.telescope")

		telescope.setup({
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
					prompt_position = "top",
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
					"--max-depth=99",
				},
				mappings = {
					i = { ["<c-t>"] = trouble.open_with_trouble },
					n = { ["<c-t>"] = trouble.open_with_trouble },
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
						"*/tmp/*",
					},
				},
				undo = {
					-- telescope-undo.nvim config, see below
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
				oldfiles = {
					cwd_only = true,
				},
			},
		})

		vim.api.nvim_create_autocmd({ "User" }, {
			pattern = "TelescopePreviewerLoaded",
			callback = function()
				vim.opt_local.number = true
			end,
		})

		-- telescope.load_extension("fzy_native")
		telescope.load_extension("fzf")
		telescope.load_extension("undo")
	end,
	keys = {
		-- telescope file helpers
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Find files",
		},
		{
			"<leader>fo",
			function()
				require("telescope.builtin").oldfiles()
			end,
			desc = "Recent files",
		},
		{
			"<leader>FF",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find()
			end,
			desc = "Find in buffer",
		},
		{
			"<leader>fg",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Live grep",
		},
		{
			"<leader>fG",
			function()
				require("telescope.builtin").grep_string()
			end,
			desc = "Grep string",
		},
		{
			"<leader>fb",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Search buffers",
		},

		-- telescope lsp/treesitter helpers
		{
			"<leader>fr",
			function()
				require("telescope.builtin").lsp_references()
			end,
			desc = "LSP references",
		},
		{
			"<leader>fs",
			function()
				require("telescope.builtin").lsp_document_symbols()
			end,
			desc = "LSP document symbols",
		},
		{
			"<leader>ft",
			function()
				require("telescope.builtin").treesitter()
			end,
			desc = "Search treesitter nodes",
		},
		{
			"<leader>dd",
			function()
				require("telescope.builtin").diagnostics()
			end,
			desc = "Diagnostics",
		},

		-- telescope git helpers
		{
			"<leader>gf",
			function()
				require("telescope.builtin").git_files()
			end,
			desc = "Search git files",
		},
		{
			"<leader>gb",
			function()
				require("telescope.builtin").git_branches()
			end,
			desc = "Search git branches",
		},
		{
			"<leader>gc",
			function()
				require("telescope.builtin").git_commits()
			end,
			desc = "Search git commits",
		},
		{
			"<leader>bc",
			function()
				require("telescope.builtin").git_bcommits()
			end,
			desc = "Search git file commits",
		},

		-- telescope util helpers
		-- {
		-- 	"<leader>fh",
		-- 	function()
		-- 		require("telescope.builtin").help_tags()
		-- 	end,
		-- 	desc = "Search help tags",
		-- },
		{
			"<leader>fk",
			function()
				require("telescope.builtin").keymaps()
			end,
			desc = "Search keymaps",
		},
		{
			"<leader>fS",
			function()
				require("telescope.builtin").spell_suggest()
			end,
			desc = "Spell suggest",
		},
		-- {
		-- 	"<leader>rr",
		-- 	function()
		-- 		require("telescope.builtin").registers()
		-- 	end,
		-- 	desc = "Search registers",
		-- },
		{
			"<leader>fu",
			function()
				require("telescope").extensions.undo.undo()
			end,
			desc = "Telescope undo",
		},
	},
}
