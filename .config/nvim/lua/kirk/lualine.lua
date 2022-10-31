require('lualine').setup {
	sections = {
		lualine_c = { 'filename' },
		lualine_x = { 'filetype' },
		lualine_y = {},
	},
	options = {
		globalstatus = true,
	},
	winbar = {
		lualine_c = { 'filename', },
	},
	inactive_winbar = {
		lualine_c = { 'filename' },
	},
}
