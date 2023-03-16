return {
	"folke/noice.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		-- "rcarriga/nvim-notify",
	},
	event = "VeryLazy",
	opts = {
		cmdline = {
			view = "cmdline",
		},
		lsp = {
			progress = {
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
