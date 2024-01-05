return {
	"lukas-reineke/indent-blankline.nvim",
	cond = not vim.g.started_by_firenvim,
	version = "v2.*",
	-- version = "Version 3.*", -- uncomment for v3
	-- main = "ibl", -- uncomment for v3
	event = "VimEnter",
	cmd = {
		-- v3 commands
		"IBLEnable",
		"IBLDisable",
		"IBLToggle",
		"IBLEnableScope",
		"IBLDisableScope",
		"IBLToggleScope",
	},
	opts = {

		-- v3 config
		enabled = true,
		indent = {
			char = "▏",
			smart_indent_cap = true,
		},
		whitespace = {
			remove_blankline_trail = false,
		},
		scope = {
			enabled = false,
			char = "▏",
			show_start = false,
			show_end = false,
		},
		exclude = {
			filetypes = {
				"help",
				"startify",
				"dashboard",
				"packer",
				"neogitstatus",
				"NvimTree",
				"Trouble",
				"alpha",
			},
		},

		-- v2 config
		char = "▏",
		context_char = "▏",
		use_treesitter = false,
		show_current_context = false,
		max_indent_increase = 1,
		show_trailing_blankline_indent = false,
		filetype_exclude = {
			"help",
			"startify",
			"dashboard",
			"packer",
			"neogitstatus",
			"NvimTree",
			"Trouble",
			"alpha",
		},
	},
}
