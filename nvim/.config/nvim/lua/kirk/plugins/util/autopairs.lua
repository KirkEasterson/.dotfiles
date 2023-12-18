return {
	"windwp/nvim-autopairs",
	cond = not vim.g.started_by_firenvim,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	event = {
		"InsertEnter",
		"CmdlineEnter",
	},
	opts = {
		check_ts = true,
		enable_check_bracket_line = false,
		ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
	},
	config = function(_, opts)
		local autopairs = require("nvim-autopairs")
		local rule = require("nvim-autopairs.rule")
		local ts_conds = require("nvim-autopairs.ts-conds")

		autopairs.setup(opts)
		autopairs.add_rules({
			rule("<", ">", {
				"astro",
				"fsharp",
				"glimmer",
				"handlebars",
				"hbs",
				"html",
				"javascript",
				"javascriptreact",
				"jsx",
				"markdown",
				"ocaml",
				"php",
				"rescript",
				"svelte",
				"tsx",
				"typescript",
				"typescriptreact",
				"vue",
				"xml",
			}),
			-- }):with_pair(ts_conds.is_ts_node({ "Type" })),
		})
	end,
}
