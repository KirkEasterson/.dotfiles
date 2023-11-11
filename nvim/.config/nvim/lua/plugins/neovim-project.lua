return {
	"coffebar/neovim-project",
	enabled = false,
	dependencies = {
		{ "nvim-lua/plenary.nvim", },
		{ "nvim-telescope/telescope.nvim", tag = "0.1.4", },
		{ "Shatur/neovim-session-manager", },
	},
	cmd = {
		"NeovimProjectLoadRecent",
	},
	lazy = false,
	priority = 100,
	init = function ()
		vim.opt.sessionoptions:append("globals")
	end,
	opts = {
		projects = {
			-- "~/projects/*",
			-- "~/.config/*",
		},
	},
}
