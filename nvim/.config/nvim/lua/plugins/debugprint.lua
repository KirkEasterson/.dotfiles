return {
	"andrewferrier/debugprint.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter"
	},
	keys = {
		{ "g?p", function() require('debugprint').debugprint() end },
		{ "g?P", function() require('debugprint').debugprint({ above = true }) end },
		{ "g?v", function() require('debugprint').debugprint({ variable = true }) end,               mode = { "n", "v" } },
		{ "g?V", function() require('debugprint').debugprint({ variable = true, above = true }) end, mode = { "n", "v" } },
		{ "g?d", function() require('debugprint').deleteprints() end },
	},
	cmd = {
		"DeleteDebugPrints",
	},
	opts = {
		create_keymaps = false,
		filetype = {
			["fsharp"] = {
				left = 'printfn $"',
				right = '"',
				mid_var = "{",
				right_var = '}"',
			},
		},
	},
}
