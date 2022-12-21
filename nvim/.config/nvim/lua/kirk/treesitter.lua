require('nvim-treesitter.configs').setup({
	ensure_installed = "all",
	-- ensure_installed = {
	-- 	-- "bash",
	-- 	-- "bibtex",
	-- 	-- "c",
	-- 	-- "c_sharp",
	-- 	-- "cmake",
	-- 	-- "comment",
	-- 	-- "cpp",
	-- 	-- "css",
	-- 	-- "diff",
	-- 	-- "dockerfile",
	-- 	-- "dot",
	-- 	-- "fish",
	-- 	-- "git_rebase",
	-- 	-- "gitattributes",
	-- 	-- "gitcommit",
	-- 	-- "gitignore",
	-- 	-- "go",
	-- 	-- "gomod",
	-- 	-- "gowork",
	-- 	-- "help",
	-- 	-- "html",
	-- 	-- "http",
	-- 	-- "java",
	-- 	-- "javascript",
	-- 	-- "jsdoc",
	-- 	-- "json",
	-- 	-- "json5",
	-- 	-- "jsonc",
	-- 	-- "jsonnet",
	-- 	-- "kotlin",
	-- 	-- "latex",
	-- 	-- "lua",
	-- 	-- "lua",
	-- 	-- "make",
	-- 	-- "markdown",
	-- 	-- "markdown_inline",
	-- 	-- "nix",
	-- 	-- "norg",
	-- 	-- "php",
	-- 	-- "phpdoc",
	-- 	-- "proto",
	-- 	-- "python",
	-- 	-- "r",
	-- 	-- "regex",
	-- 	-- "rust",
	-- 	-- "scss",
	-- 	-- "slint",
	-- 	-- "sql",
	-- 	-- "todotxt",
	-- 	-- "toml",
	-- 	-- "tsx",
	-- 	-- "typescript",
	-- 	-- "vue",
	-- 	-- "yaml",
	-- },
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	}
})

require("nvim-treesitter.install").prefer_git = true

require('treesitter-context').setup({})

require('nvim-treesitter.configs').setup({
	refactor = {
		highlight_current_scope = {
			enable = false,
		},
		highlight_definitions = {
			enable = true,
			clear_on_cursor_move = false,
		},
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "<leader>rn",
			},
		},
	},
	textobjects = {
		lsp_interop = {
			enable = true,
			border = 'none',
			peek_definition_code = {
				["<leader>df"] = "@function.outer",
				["<leader>dF"] = "@class.outer",
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
			selection_modes = {
				['@parameter.outer'] = 'v', -- charwise
				['@function.outer'] = 'V', -- linewise
				['@class.outer'] = '<c-v>', -- blockwise
			},
			include_surrounding_whitespace = true,
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
		},
	},
})
