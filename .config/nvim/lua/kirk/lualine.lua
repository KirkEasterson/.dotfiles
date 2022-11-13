require('lualine').setup {
	options = {
		globalstatus = true,
		component_separators = { left = '|', right = '|' },
		section_separators = { left = '', right = '' },
		refresh = {
			statusline = 50,
			-- tabline = 50,
			-- winbar = 50,
		}
	},
	sections = {
		lualine_c = {},

		-- DEFAULTS
		-- lualine_a = { 'mode' },
		-- lualine_b = { 'branch', 'diff', 'diagnostics' },
		-- lualine_c = { 'filename' },
		-- lualine_x = { 'encoding', 'fileformat', 'filetype' },
		-- lualine_y = { 'progress' },
		-- lualine_z = { 'location' }
	},
}
