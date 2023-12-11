return {
	"akinsho/toggleterm.nvim",
	version = "*",
	cmd = {
		"TermSelect",
		"ToggleTerm",
		"ToggleTermSendCurrentLine",
		"ToggleTermSendVisualLines",
		"ToggleTermSendVisualSelection",
		"ToggleTermSetName",
		"ToggleTermToggleAll",
	},
	keys = {
		{
			"<leader>t",
			desc = "Terminal",
		},
		{
			"<leader>tt",
			function()
				require("toggleterm").toggle()
			end,
			desc = "Terminal - toggle",
		},
		{
			"<leader>ts",
			-- function()
			-- 	require("toggleterm").send_lines_to_terminal("single_line", false, {})
			-- end,
			"<Cmd>ToggleTermSendCurrentLine<CR>",
			mode = "n",
			desc = "Terminal - send current line",
		},
		{
			"<leader>ts",
			-- function()
			-- 	require("toggleterm").send_lines_to_terminal("visual_line", false, {})
			-- end,
			"<Cmd>ToggleTermSendVisualLines<CR>",
			mode = "x",
			desc = "Terminal - send visual lines",
		},
		{
			"<leader>ts",
			-- function()
			-- 	require("toggleterm").send_lines_to_terminal("visual_selection", false, {})
			-- end,
			"<Cmd>ToggleTermSendVisualSelection<CR>",
			mode = "v",
			desc = "Terminal - send visual selection",
		},
	},
	opts = {},
}
