return {
	"andrewferrier/debugprint.nvim",
	cond = not vim.g.started_by_firenvim,
	enabled = false,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{
			"g?p",
			function()
				require("debugprint").debugprint()
			end,
			desc = "Debug print line below",
		},
		{
			"g?P",
			function()
				require("debugprint").debugprint({ above = true })
			end,
			desc = "Debug print line above",
		},
		{
			"g?v",
			function()
				require("debugprint").debugprint({ variable = true })
			end,
			mode = { "n", "v" },
			desc = "Debug print variable below",
		},
		{
			"g?V",
			function()
				require("debugprint").debugprint({
					variable = true,
					above = true,
				})
			end,
			mode = { "n", "v" },
			desc = "Debug print variable above",
		},
		{
			"g?d",
			function()
				require("debugprint").deleteprints()
			end,
			desc = "Clear debug prints",
		},
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
