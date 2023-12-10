return {
	"NvChad/nvim-colorizer.lua",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	cmd = {
		"ColorizerAttachToBuffer",
		"ColorizerDetachFromBuffer",
		"ColorizerReloadAllBuffers",
		"ColorizerToggle",
	},
	opts = {},
}
