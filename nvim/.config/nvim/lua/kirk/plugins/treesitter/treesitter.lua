local get_ensure_installed = function()
	-- TODO: maybe use ENV variables
	local base_parsers = {
		"bash",
		"comment",
		"css",
		"csv",
		"diff",
		"dockerfile",
		"git_config",
		"git_rebase",
		"gitattributes",
		"gitcommit",
		"gitignore",
		"go",
		"gomod",
		"gosum",
		"gowork",
		"hjson",
		"html",
		"http",
		"javascript",
		"json",
		"json5",
		"jsonc",
		"make",
		"markdown",
		"markdown_inline",
		"proto",
		"python",
		"regex",
		"terraform",
		"todotxt",
		"toml",
		"tsv",
		"typescript",
		"xml",
		"yaml",
	}

	if require("util").indocker() then
		return base_parsers
	end

	return {
		unpack(base_parsers),
		unpack({
			"c",
			"cpp",
			"lua",
			"cmake",
			"luadoc",
			"luap",
			"luau",
			"norg",
			"ocaml",
			"ocaml_interface",
			"odin",
			"rust",
			"sxhkdrc",
			"typescript",
			"vim",
			"vimdoc",
			"zig",
			-- "bibtex",
			-- "c_sharp",
			-- "java",
			-- "latex",
		}),
	}
end

local ensure_installed = get_ensure_installed()

return {
	"nvim-treesitter/nvim-treesitter",
	cond = not vim.g.started_by_firenvim,
	event = {
		"BufNewFile",
		"BufReadPre",
	},
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	version = "*",
	cmd = {
		"TSBufDisable",
		"TSBufEnable",
		"TSDisable",
		"TSEnable",
		"TSModuleInfo",
	},
	opts = {
		modules = {},
		auto_install = true,
		sync_install = false,
		indent = {
			enable = true,
		},
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
			disable = function(lang, buf)
				local max_filesize = 100 * 1024 -- 100 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gnn", -- set to `false` to disable one of the mappings
				node_incremental = "grn",
				scope_incremental = "grc",
				node_decremental = "grm",
			},
		},
		ensure_installed = ensure_installed,
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		parser_config.fsharp = {
			install_info = {
				url = "https://github.com/Nsidorenco/tree-sitter-fsharp",
				branch = "main",
				files = { "src/scanner.cc", "src/parser.c" },
				generate_requires_npm = true,
				requires_generate_from_grammar = true,
			},
			filetype = "fsharp",
		}
	end,
}
