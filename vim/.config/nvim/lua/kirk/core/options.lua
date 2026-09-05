-- Used to suppress deprecation warnings from plugins. This should occasionally
-- be toggled to ensure there is no deprecated code in this config.
vim.deprecate = function() end

vim.g.mapleader = " " -- prefix key
vim.g.maplocalleader = " " -- secondary prefix key

vim.opt.updatetime = 200 -- ms to wait for trigger an event
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
  -- "node_provider", -- this might be necessary for mason
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
  "node_provider",
  "perl_provider",
}
for _, v in pairs(enabled_plugins) do
  vim.g["loaded_" .. v] = false
end

local session_opts = {
  "buffers",
  "curdir",
  "folds",
  "globals",
  "help",
  "localoptions",
  "options",
  -- "resize", -- DO NOT ENABLE: this cause rendering issues with tiling window managers
  "tabpages",
  "terminal",
  "winpos",
  "winsize",
}
vim.o.sessionoptions = table.concat(session_opts, ",")

vim.o.lazyredraw = true

vim.opt.title = true
vim.opt.titlelen = 0
vim.opt.titlestring = "nvim - %{substitute(getcwd(), $HOME, '~', '')}"

vim.opt.winbar = "%{%v:lua.require('util').winbar()%}"

vim.opt.spell = true
vim.opt.spelllang = {
  "en_us",
  -- "sv",
  "nb",
}
vim.api.nvim_set_hl(0, "SpellBad", { fg = nil, cterm = { undercurl = true } })
vim.api.nvim_set_hl(0, "SpellCap", { fg = nil, cterm = { undercurl = true } })
vim.api.nvim_set_hl(0, "SpellRare", { fg = nil, cterm = { undercurl = true } })
vim.api.nvim_set_hl(0, "SpellLocal", { fg = nil, cterm = { undercurl = true } })

vim.opt.number = true -- show line numbers
vim.opt.relativenumber = true -- show relative line numbers
vim.opt.cursorline = true -- highlight the current line
vim.opt.cursorlineopt = "both" -- highlight both line and number
vim.opt.termguicolors = true -- allow custom highlighting
vim.opt.incsearch = true -- highlight matches as you type
vim.opt.hlsearch = false -- unhighlight matches after searching
vim.opt.autoindent = true -- new lines inherit indenting
vim.opt.wrap = false -- don't wrap lines
vim.opt.linebreak = true -- if wrapping, wrap on complete words
vim.opt.breakindent = true -- preserve indenting on wrapped lines

vim.opt.visualbell = false
vim.opt.errorbells = false
vim.opt.showcmd = false
vim.opt.belloff = "esc"

vim.opt.hidden = true -- Enable background buffers
vim.opt.history = 100 -- Remember N lines in history
vim.opt.lazyredraw = false

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
--  - "n": recognize lists
--  - "v": break line at empty space
--  - "j": remove comment leader when joining lines
vim.opt.formatoptions = "cnvj" -- automatically apply text width only to comments

vim.opt.tabstop = 4 -- number of visual spaces per tab
vim.opt.softtabstop = 4 -- number of spaces in tab when editing
vim.opt.shiftwidth = 4 -- number of spaces when indenting with <> keys

vim.opt.mouse = "a" -- enable mouse for scrolling and resizing
vim.opt.mousehide = true
vim.opt.mousemodel = "extend" -- don't show right click menu
vim.opt.mousemoveevent = true
-- vim.opt.mousesshape = "vs:lrsizing"

vim.opt.nrformats = "alpha,octal,hex,bin"

vim.opt.wildmenu = true -- visual autocompletion for command menu
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
vim.opt.fillchars:append({
  eob = " ",
  diff = "╱",

  -- folds
  fold = " ",
  foldclose = "",
  foldopen = "",
  foldsep = " ",

  -- win separator
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋",
})

vim.o.foldenable = true
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- short messages
vim.opt.shortmess:append("IWsA")

vim.opt.swapfile = false -- don't create swap files
vim.opt.autoread = true -- sync buffers automatically

vim.opt.splitright = true --  splits open to the right
vim.opt.splitbelow = true --  splits open below
vim.opt.splitkeep = "cursor" -- keep topline on split resizing

-- NOTE: this isn't backwards compatible. it still requires the user to press
-- enter for empty messages. don't restore this comment until that issue is fixed
-- opt.cmdheight = 0 -- hide the command line

vim.opt.undofile = true -- persistent undos
vim.opt.confirm = true -- show confirm dialog when closing unsaved files

vim.opt.laststatus = 3 -- aesthetic win separators

vim.opt.winborder = "rounded"
