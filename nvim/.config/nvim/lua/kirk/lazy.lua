-- bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

lazy.setup({
	{ import = "kirk.plugins.dev" },
	{ import = "kirk.plugins.git" },
	{ import = "kirk.plugins.lsp" },
	{ import = "kirk.plugins.misc" },
	{ import = "kirk.plugins.notes" },
	{ import = "kirk.plugins.run" },
	{ import = "kirk.plugins.telescope" },
	{ import = "kirk.plugins.theme" },
	{ import = "kirk.plugins.treesitter" },
	{ import = "kirk.plugins.ui" },
	{ import = "kirk.plugins.util" },
}, {
	defaults = {
		lazy = true,
		-- version = "*", -- use latest stable versions for plugin
	},
	ui = {
		border = "rounded",
		title = "Lazy",
	},
	change_detection = {
		notify = false,
	},
	checker = {
		enabled = true,
	},
	install = {
		colorscheme = { "gruvbox" },
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"rplugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
	dev = {
		path = "~/dev/",
		fallback = true,
	},
})
