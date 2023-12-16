return {
	"nvim-telescope/telescope.nvim",
	cond = not vim.g.started_by_firenvim,
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- "nvim-telescope/telescope-fzy-native.nvim",
		"nvim-telescope/telescope-fzf-native.nvim",
	},
	cmd = {
		"Telescope",
	},
	keys = {
		{
			"<leader>f",
			desc = "Telescope",
		},

		-- file helpers
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Find files",
		},
		{
			"<leader>fF",
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

		-- lsp/treesitter helpers
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
			"<leader>fd",
			function()
				require("telescope.builtin").diagnostics()
			end,
			desc = "Diagnostics",
		},

		-- git helpers
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
			"<leader>gr",
			function()
				require("telescope.builtin").git_bcommits()
			end,
			desc = "Search git file commits",
		},

		-- util helpers
		{
			"<leader>fh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "Search help tags",
		},
		{
			"<leader>fk",
			function()
				require("telescope.builtin").keymaps()
			end,
			desc = "Search keymaps",
		},
		{
			"<leader>fp",
			function()
				require("telescope.builtin").spell_suggest()
			end,
			desc = "Spell suggest",
		},
		{
			"<leader>fe",
			function()
				require("telescope.builtin").registers()
			end,
			desc = "Search registers",
		},
	},
	opts = {
		defaults = {
			color_devicons = true,
			entry_prefix = "  ",
			prompt_prefix = " ",
			selection_caret = " ",
			sorting_strategy = "ascending",
			layout_strategy = "vertical",
			layout_config = {
				prompt_position = "top",
				mirror = true,
			},
			file_ignore_patterns = {
				"%.a",
				"%.cache",
				"%.class",
				"%.git/",
				"%.mkv",
				"%.mp4",
				"%.o",
				"%.out",
				"%.pdf",
				"%.zip",
				"./node%_modules/*",
				"mocks/*",
				"packer_compiled.lua",
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
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
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
	},
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension("fzf")
		-- telescope.load_extension("fzy_native")

		vim.api.nvim_create_autocmd({ "User" }, {
			pattern = "TelescopePreviewerLoaded",
			callback = function()
				vim.opt_local.number = true
			end,
			desc = "Enable line numbers in telescope results",
		})
	end,
}
