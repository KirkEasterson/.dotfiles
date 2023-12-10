return {
	"folke/noice.nvim",
	cond = not vim.g.started_by_firenvim,
	enabled = false,
	dependencies = {
		"MunifTanjim/nui.nvim",
		-- "rcarriga/nvim-notify",
	},
	cmd = {
		"Noice",
		"NoiceDisable",
		"NoiceLast",
	},
	event = "VeryLazy",
	opts = {
		cmdline = {
			view = "cmdline",
		},
		lsp = {
			hover = {
				enabled = false,
			},
			progress = {
				enabled = false,
			},
			signature = {
				enabled = false,
			},
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
			inc_rename = false,
			lsp_doc_border = false,
		},
		messages = {
			enabled = false,
		},
	},
}
