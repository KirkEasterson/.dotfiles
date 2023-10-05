return {
	"nvim-treesitter/nvim-treesitter",
	cond = not vim.g.started_by_firenvim,
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
		"nvim-treesitter/nvim-treesitter-refactor",
		"nvim-treesitter/nvim-treesitter-textobjects",
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	event = "VeryLazy",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			modules = {},
			ensure_installed = {
				"bash",
				"bibtex",
				"c",
				"c_sharp",
				"clojure",
				"cmake",
				"comment",
				"commonlisp",
				"cpp",
				"css",
				"csv",
				"diff",
				"dockerfile",
				"doxygen",
				"fennel",
				"fish",
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
				"go",
				"gomod",
				"gosum",
				"gowork",
				"haskell",
				"haskell_persistent",
				"hjson",
				"html",
				"http",
				"java",
				"javascript",
				"json",
				"json5",
				"jsonc",
				"jsonnet",
				"kotlin",
				"latex",
				"lua",
				"luadoc",
				"luap",
				"luau",
				"make",
				"markdown",
				"markdown_inline",
				"nix",
				"norg",
				"ocaml",
				"ocaml_interface",
				"proto",
				"python",
				"regex",
				"sxhkdrc",
				"terraform",
				"todotxt",
				"toml",
				"tsv",
				"typescript",
				"vim",
				"vimdoc",
				"xml",
				"yaml",
				"zig",
			},
			disable = function(lang, buf)
				local max_filesize = 100 * 1024 -- 100 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
			ignore_install = {},
			auto_install = true,
			sync_install = false,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			context_commentstring = {
				enable = true,
			},
			indent = {
				enable = true,
			},
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
			textobjects = {
				lsp_interop = {
					enable = true,
					border = "none",
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
						["@parameter.outer"] = "v", -- charwise
						["@function.outer"] = "V", -- linewise
						["@class.outer"] = "<c-v>", -- blockwise
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

		local ts_parsers = require("nvim-treesitter.parsers")

		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = { "*", },
			callback = function()
				local ft = vim.bo.filetype
				if not ft then
					return
				end
				local parser = ts_parsers.filetype_to_parsername[ft]
				if not parser then
					return
				end
				local is_installed = ts_parsers.has_parser(ts_parsers.ft_to_lang(
					ft))
				if not is_installed then
					vim.cmd("TSInstall " .. parser)
				end
			end,
		})
	end,
}
