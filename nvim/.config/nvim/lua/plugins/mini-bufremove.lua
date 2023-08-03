return {
	'echasnovski/mini.bufremove',
	-- enabled = false, -- TODO: replace with a simple binding
	version = '*',
	keys = {
		{
			"<C-w>",
			function() require("mini.bufremove").delete() end,
			desc = "Generate docs",
		},
	},
	opts = {},
}
