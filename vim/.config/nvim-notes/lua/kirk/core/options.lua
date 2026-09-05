vim.g.mapleader = " " -- prefix key
vim.g.maplocalleader = " " -- secondary prefix key

vim.g.timeout = true
vim.g.ttimeout = true
vim.g.timeoutlen = 100
vim.g.ttimeoutlen = 100

-- disable builtin plugins
local disabled_plugins = {
  "2html_plugin",
  "bugreport",
  "compiler",
  -- "ftplugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwFileHandlers",
  "netrwPlugin",
  "netrwSettings",
  "node_provider",
  "optwin",
  "perl_provider",
  "python3_provider",
  "rplugin",
  "rrhelper",
  "ruby_provider",
  -- "spellfile_plugin",
  "synmenu",
  "tar",
  "tarPlugin",
  "tutor",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  -- "matchbracket",
  -- "matchit",
  -- "matchparen",
}
for _, v in pairs(disabled_plugins) do
  vim.g["loaded_" .. v] = true
end

-- enable builtin plugins
local enabled_plugins = {
  "matchbracket",
  "matchparen",
}
for _, v in pairs(enabled_plugins) do
  vim.g["loaded_" .. v] = false
end

vim.opt.mousescroll = "ver:3,hor:3"

vim.o.lazyredraw = true

vim.opt.title = true
vim.opt.titlelen = 0
vim.opt.titlestring = "nvim - %{substitute(getcwd(), $HOME, '~', '')}"

vim.opt.winbar = "%{%v:lua.require('util').winbar()%}"

vim.opt.spell = false
vim.opt.number = true -- show line numbers
vim.opt.relativenumber = true -- show relative line numbers
vim.opt.cursorline = true -- highlight the current line
vim.opt.cursorlineopt = "both" -- highlight both line and number
vim.opt.termguicolors = true -- allow custom highlighting
vim.opt.incsearch = true -- highlight matches as you type
vim.opt.hlsearch = false -- unhighlight matches after searching
vim.opt.autoindent = true -- new lines inherit indenting
vim.opt.wrap = true
vim.opt.linebreak = true -- if wrapping, wrap on complete words
vim.opt.breakindent = true -- preserve indenting on wrapped lines

vim.opt.tabstop = 2 -- number of visual spaces per tab
vim.opt.softtabstop = 2 -- number of spaces in tab when editing
vim.opt.shiftwidth = 2 -- number of spaces when indenting with <> keys
vim.opt.expandtab = true -- use spaces for tabs

vim.opt.visualbell = false
vim.opt.errorbells = true
vim.opt.belloff = "esc"

vim.opt.hidden = true -- Enable background buffers
vim.opt.history = 100 -- Remember N lines in history
vim.opt.lazyredraw = false
vim.opt.updatetime = 250 -- ms to wait for trigger an event

vim.opt.syntax = "enable" -- show syntax highlighting
vim.opt.showmatch = true -- highlight matching brackets
vim.opt.scrolloff = 4 -- scroll when y away from vertical edge
-- vim.opt.smoothscroll = true -- doesn't work for some reason
vim.opt.sidescrolloff = 8 -- scroll when x away from horizontal edge
vim.opt.signcolumn = "yes" -- column for linting
vim.opt.colorcolumn = "80" -- show line for 80char soft-limit
-- vim.opt.textwidth = 80 -- text limit, but will only be applied to comments

-- formatting options (`:h fo-table`)
--  - "c": enable formatting for comments
--  - "a": automatically apply formatting
--  - "n": recognize lists
--  - "v": break line at empty space
--  - "j": remove comment leader when joining lines
-- vim.opt.formatoptions = "canvj" -- automatically apply text width only to comments

vim.opt.mouse = "a" -- enable mouse for scrolling and resizing
vim.opt.mousehide = true
vim.opt.mousemodel = "extend" -- don't show right click menu
vim.opt.mousemoveevent = true
-- vim.opt.mousesshape = "vs:lrsizing"

vim.opt.nrformats = "alpha,octal,hex,bin"

-- vim.opt.wildmenu = true -- visual autocompletion for command menu
vim.opt.wildmode = { "full", "list", "longest" }

vim.opt.list = true -- enable rendering of listchars
vim.opt.listchars:append({
  extends = "…",
  lead = " ",
  precedes = "…",
  tab = "  ", -- this must be two characters
  trail = "·",

  -- use the below line to simulate indent-blankline
  --	it won't be visible on empty-lines though
  -- leadmultispace = "│ ",
  -- multispace     = "│ ",
  -- tab            = "│ ", -- this must be two characters
})
vim.opt.fillchars:append({ eob = " " })

-- short messages
vim.opt.shortmess:append("IWsA")

vim.opt.swapfile = false -- don't create swap files
vim.opt.autoread = true -- sync buffers automatically

vim.opt.splitright = true --  splits open to the right
vim.opt.splitbelow = true --  splits open below
vim.opt.splitkeep = "topline" -- keep topline on split resizing

vim.opt.undofile = true -- persistent undos
vim.opt.confirm = true -- show confirm dialog when closing unsaved files

vim.opt.laststatus = 3 -- aesthetic win separators

vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.opt.winborder = "rounded"

vim.diagnostic.config({
  virtual_text = false,
  float = {
    border = "rounded",
  },
  inlay_hints = {
    enabled = false,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅘",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "󰌶",
    },
  },
})

if vim.fn.executable("rg") == 1 then
  vim.opt.grepprg = "rg --vimgrep"
  vim.opt.grepformat = "%f:%l:%c:%m"
end
