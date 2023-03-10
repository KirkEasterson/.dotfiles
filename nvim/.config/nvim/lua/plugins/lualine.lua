return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
	event = "VeryLazy",
	opts = {
		options = {
			globalstatus = true,
			component_separators = { left = '', right = '' },
			section_separators = { left = '', right = '' },
			refresh = {
				statusline = 50,
				-- tabline = 50,
				-- winbar = 50,
			}
		},
		sections = {
			lualine_c = {},
		},
	},
}
