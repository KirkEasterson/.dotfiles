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

local setup_dirs = {
  { import = "kirk.plugins.dap" },
  { import = "kirk.plugins.dev" },
  { import = "kirk.plugins.firenvim" },
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
}

-- https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819214
if not not vim.g.started_by_firenvim then
  setup_dirs = {
    { import = "kirk.plugins.theme" },
    { import = "kirk.plugins.firenvim" },
  }
end

lazy.setup({
  { import = "kirk.plugins.dap" },
  { import = "kirk.plugins.db" },
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
    version = "*", -- use latest stable versions for plugin
  },
  ui = {
    border = "rounded",
    title = "Lazy",
  },
  change_detection = {
    notify = false,
  },
  -- checker = {
  -- 	enabled = true,
  -- },
  install = {
    colorscheme = { "gruvbox" },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "bugreport",
        "compiler",
        "ftplugin",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        -- "matchbracket",
        -- "matchit",
        -- "matchparen",
        "netrw",
        "netrwFileHandlers",
        "netrwPlugin",
        "netrwSettings",
        "optwin",
        "rplugin",
        "rrhelper",
        "spellfile_plugin",
        "synmenu",
        "tar",
        "tarPlugin",
        "tohtml",
        "tutor",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
      },
    },
  },
  dev = {
    path = "~/dev/",
    fallback = true,
  },
})
