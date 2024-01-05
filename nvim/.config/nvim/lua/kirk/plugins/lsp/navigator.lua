return {
	"ray-x/navigator.lua",
	cond = not vim.g.started_by_firenvim,
	enabled = false,
	dependencies = {
		{ "ray-x/guihua.lua", build = "cd lua/fzy && make" },
		{ "neovim/nvim-lspconfig" },
	},
	opts = {
		-- border = "rounded"
	},
}
