local g = vim.g
local opt = vim.opt

g.mapleader = " " -- prefix key
g.maplocalleader = " " -- secondary prefix key

g.timeout = true
g.ttimeout = true
g.timeoutlen = 100
g.ttimeoutlen = 100

-- disable builtin plugins
local disabled_plugins = {
  "2html_plugin",
  "bugreport",
  "compiler",
  "ftplugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwFileHandlers",
  "netrwPlugin",
  "netrwSettings",
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
  g["loaded_" .. v] = true
end

-- enable builtin plugins
local enabled_plugins = {
  "matchbracket",
  "matchparen",
  "node_provider",
  "perl_provider",
}
for _, v in pairs(enabled_plugins) do
  g["loaded_" .. v] = false
end

-- neovide
if g.neovide then
  opt.linespace = 4
  g.neovide_remember_window_size = false
  g.neovide_hide_mouse_when_typing = true

  g.neovide_window_blurred = false
  g.neovide_transparency = 1.0
  g.neovide_floating_blur_amount_y = 0.0
  g.neovide_floating_shadow = false
  g.neovide_show_border = false

  g.neovide_position_animation_length = 0.1
  g.neovide_scroll_animation_length = 0.1

  g.neovide_cursor_animation_length = 0.0
  g.neovide_cursor_trail_size = 0.0
  g.neovide_cursor_antialiasing = true
  g.neovide_cursor_animate_in_insert_mode = false
  g.neovide_cursor_animate_command_line = false

  g.neovide_input_macos_alt_is_meta = true
  g.neovide_refresh_rate = 60
  g.neovide_refresh_rate_idle = 5

  vim.keymap.set("v", "<D-c>", "\"+y") -- Copy
  vim.keymap.set("i", "<D-v>", "<ESC>l\"+Pli") -- Paste insert mode
else
  opt.mousescroll = "ver:3,hor:3"
end

opt.wildignore:append({
  "*.aux",
  "*.bbl",
  "*.blg",
  "*.cls",
  "*.fdb",
  "*.fdb_latexmk",
  "*.fls",
  "*.glo",
  "*.ist",
  "*.log",
  "*.o",
  "*.out",
  "*.pyc",
  "*.toc",
  "*pycache*",
  "*~",
  "Cargo.Bazel.lock",
  "Cargo.lock",
  "__pycache__",
  "__site",
  "**/node_modules/**",
  "target",
  "venv",
})

opt.title = true
opt.titlelen = 0
opt.titlestring = "nvim - %{substitute(getcwd(), $HOME, '~', '')}"

opt.winbar = "%{%v:lua.require('util').winbar()%}"

opt.spell = true
opt.spelllang = {
  "en_us",
  -- "sv",
  -- "nb",
}
vim.cmd([[highlight SpellBad cterm=undercurl ctermfg=247 gui=undercurl guifg=NONE]])
vim.cmd([[highlight SpellCap cterm=undercurl ctermfg=247 gui=undercurl guifg=NONE]])
vim.cmd([[highlight SpellRare cterm=undercurl ctermfg=247 gui=undercurl guifg=NONE]])
vim.cmd([[highlight SpellLocal cterm=undercurl ctermfg=247 gui=undercurl guifg=NONE]])

opt.number = true -- show line numbers
opt.relativenumber = true -- show relative line numbers
opt.cursorline = true -- highlight the current line
opt.cursorlineopt = "both" -- highlight both line and number
opt.termguicolors = true -- allow custom highlighting
opt.incsearch = true -- highlight matches as you type
opt.hlsearch = false -- unhighlight matches after searching
opt.autoindent = true -- new lines inherit indenting
opt.wrap = false -- don't wrap lines
opt.linebreak = true -- if wrapping, wrap on complete words
opt.breakindent = true -- preserve indenting on wrapped lines
opt.lazyredraw = true -- redraw only when needed

opt.visualbell = false
opt.errorbells = true
opt.belloff = "esc"

opt.hidden = true -- Enable background buffers
opt.history = 100 -- Remember N lines in history
opt.lazyredraw = true -- Faster scrolling
opt.updatetime = 250 -- ms to wait for trigger an event

opt.syntax = "enable" -- show syntax highlighting
opt.showmatch = true -- highlight matching brackets
opt.scrolloff = 4 -- scroll when y away from vertical edge
-- opt.smoothscroll = true -- doesn't work for some reason
opt.sidescrolloff = 8 -- scroll when x away from horizontal edge
opt.signcolumn = "yes" -- column for linting
opt.colorcolumn = "80" -- show line for 80char soft-limit
-- opt.textwidth = 80 -- text limit, but will only be applied to comments

-- formatting options (`:h fo-table`)
--  - "c": enable formatting for comments
--  - "a": automatically apply formatting
--  - "n": recognize lists
--  - "v": break line at empty space
--  - "j": remove comment leader when joining lines
-- opt.formatoptions = "canvj" -- automatically apply text width only to comments

opt.tabstop = 4 -- number of visual spaces per tab
opt.softtabstop = 4 -- number of spaces in tab when editing
opt.shiftwidth = 4 -- number of spaces when indenting with <> keys

opt.mouse = "a" -- enable mouse for scrolling and resizing
opt.mousehide = true
opt.mousemodel = "extend" -- don't show right click menu
opt.mousemoveevent = true
-- opt.mousesshape = "vs:lrsizing"

opt.nrformats = "alpha,octal,hex,bin"

opt.wildmenu = true -- visual autocompletion for command menu
opt.wildmode = { "full", "list", "longest" }

opt.list = true -- enable rendering of listchars
opt.listchars:append({
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
opt.fillchars:append({
  eob = " ",
  diff = "╱",

  -- folds
  fold = " ",
  foldclose = "󰅂",
  foldopen = "󰅀",
  foldsep = "│",

  -- win separator
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋",
})

-- short messages
opt.shortmess:append("IWsA")

opt.swapfile = false -- don't create swap files
opt.autoread = true -- sync buffers automatically

opt.splitright = true --  splits open to the right
opt.splitbelow = true --  splits open below
opt.splitkeep = "topline" -- keep topline on split resizing

-- NOTE: this isn't backwards compatible. it still requires the user to press
-- enter for empty messages. don't restore this comment until that issue is fixed
-- opt.cmdheight = 0 -- hide the command line

opt.undofile = true -- persistent undos
opt.confirm = true -- show confirm dialog when closing unsaved files

opt.laststatus = 3 -- aesthetic win separators

opt.completeopt = { "menu", "menuone", "noselect" }

if vim.fn.executable("rg") == 1 then
  opt.grepprg = "rg --vimgrep"
  opt.grepformat = "%f:%l:%c:%m"
end

-- TODO: is this even necessary
if vim.env.TERM == "xterm-kitty" then
  vim.cmd([[autocmd UIEnter * if v:event.chan ==# 0 | call chansend(v:stderr, "\x1b[>1u") | endif]])
  vim.cmd([[autocmd UILeave * if v:event.chan ==# 0 | call chansend(v:stderr, "\x1b[<1u") | endif]])
end

-- hacky fix for terraform files
vim.filetype.add({
  extension = {
    tf = "terraform",
  },
})
