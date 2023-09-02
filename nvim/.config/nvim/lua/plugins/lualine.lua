return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
	cond = not vim.g.started_by_firenvim,
	event = 'BufWinEnter',
	opts = {
		disabled_filetypes = {
			statusline = {
				'Scratch',
				'NVimTree',
				'alpha',
			},
		},
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
			lualine_c = {
				-- nvim_lsp.util.root_pattern('.git'),
			},
		},
	},
}
