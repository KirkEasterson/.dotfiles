return {
	'sainnhe/gruvbox-material',
	dependencies = {
		'ellisonleao/gruvbox.nvim',
	},
	enabled = false,
	lazy = false,
	priority = 1000,
	config = function(_, _)
		vim.cmd [[colorscheme gruvbox-material]]
		vim.cmd("highlight WinSeparator guibg=None guifg=" .. require('gruvbox.palette').get_base_colors().gray)
	end,
	init = function()
		vim.g.gruvbox_material_background = "medium"
		vim.g.gruvbox_material_background = "original"
		vim.g.gruvbox_material_better_performance = 1
		vim.g.gruvbox_material_enable_bold = 1
		vim.g.gruvbox_material_enable_italic = 1
		vim.g.gruvbox_material_foreground = "original"
		vim.g.gruvbox_material_ui_contrast = "high"
	end,
}
