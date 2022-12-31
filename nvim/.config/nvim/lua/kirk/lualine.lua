require('lualine').setup {
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
}
