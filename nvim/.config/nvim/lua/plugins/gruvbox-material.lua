return {
	'sainnhe/gruvbox-material',
	enabled = false,
	lazy = false,
	priority = 1000,
	config = function(_, opts)
		vim.cmd [[colorscheme gruvbox-material]]
	end,
	init = function()
		vim.o.background = "dark"

		vim.g.gruvbox_material_background = "medium"
		vim.g.gruvbox_material_better_performance = 1
		vim.g.gruvbox_material_enable_bold = 1
		vim.g.gruvbox_material_enable_italic = 1
		vim.g.gruvbox_material_foreground = "original"
		vim.g.gruvbox_material_ui_contrast = "high"
	end,
}
