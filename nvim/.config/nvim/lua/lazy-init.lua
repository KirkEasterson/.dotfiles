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
local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
	return
end

lazy.setup('plugins', {
	defaults = {
		lazy = true,
		-- version = "*", -- enable this to try installing the latest stable versions of plugins
	},
	ui = {
		border = "rounded",
	},
	change_detection = {
		notify = false,
	},
	install = {
		colorscheme = { 'gruvbox' },
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
