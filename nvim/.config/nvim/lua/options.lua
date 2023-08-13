local opt = vim.opt
local g = vim.g

g.mapleader = " "      -- prefix key
g.maplocalleader = " " -- secondary prefix key

-- disable builtin plugins
local builtin_plugins = {
	"2html_plugin",
	"bugreport",
	"compiler",
	"ftplugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"matchit",
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
	"tutor",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
}
for _, v in pairs(builtin_plugins) do
	g["loaded_" .. v] = 1
end

-- neovide
if g.neovide then
	vim.o.guifont = "ComicCodeLigatures Nerd Font, Ubuntu Mono Nerd Font:h7"
	g.neovide_refresh_rate = 60
	g.neovide_refresh_rate_idle = 5
	g.neovide_input_macos_alt_is_meta = true
	g.neovide_remember_window_size = false
	g.neovide_input_macos_alt_is_meta = true
end

opt.wildignore:append({
	"*.o",
	"*.pyc",
	"*pycache*",
	"*~",
	"Cargo.Bazel.lock",
	"Cargo.lock",
	"__pycache__",
})

opt.title = true

opt.spell = false
opt.spelllang = { "en_us", }

opt.number = true         -- show line numbers
opt.relativenumber = true -- show relative line numbers
opt.cursorline = true     -- highlight the current line
opt.termguicolors = true  -- allow custom highlighting
opt.incsearch = true      -- highlight matches as you type
opt.hlsearch = false      -- unhighlight matches after searching
opt.autoindent = true     -- new lines inherit indenting
opt.wrap = false          -- don't wrap lines
opt.linebreak = true      -- if wrapping, wrap on complete words
opt.breakindent = true    -- preserve indenting on wrapped lines

opt.visualbell = false
opt.belloff = "all"

opt.hidden = true      -- Enable background buffers
opt.history = 100      -- Remember N lines in history
opt.lazyredraw = true  -- Faster scrolling
opt.synmaxcol = 240    -- Max column for syntax highlight
opt.updatetime = 250   -- ms to wait for trigger an event

opt.syntax = "enable"  -- show syntax highlighting
opt.showmatch = true   -- highlight matching brackets
opt.scrolloff = 4      -- scroll when y away from vertical edge
-- opt.smoothscroll = true
opt.sidescrolloff = 8  -- scroll when x away from horizontal edge
opt.signcolumn = "yes" -- column for linting
opt.colorcolumn = "80" -- show line for 80char soft-limit

opt.tabstop = 4        -- number of visual spaces per tab
opt.softtabstop = 4    -- number of spaces in tab when editing
opt.shiftwidth = 4     -- number of spaces when indenting with <>

opt.mouse = "a"        -- enable mouse for scrolling and resizing
opt.mousemodel = "extend"
opt.mousehide = true
opt.mousemoveevent = true
opt.mousescroll = "ver:1,hor:1"

opt.wildmenu = true -- visual autocompletion for command menu
opt.wildmode = { "longest", "list", "full", }

opt.list = true
opt.listchars:append({
	lead = " ",
	tab = "  ",
	trail = "▒",
	extends = "",
	precedes = "",
})
opt.fillchars:append({
	eob = " ",
	fold = " ",
	foldopen = "󰅀",
	foldsep = " ",
	foldclose = "󰅂",
})

opt.swapfile = false  -- don't create swap files

opt.splitright = true --  splits open to the right
opt.splitbelow = true --  splits open below

opt.cmdheight = 0     -- hide the command line

opt.undofile = true   -- persistent undos
opt.confirm = true    -- show confirm dialog when closing unsaved files

opt.laststatus = 3    -- aesthetic win separators

opt.completeopt = { "menu", "menuone", "noselect", }

if vim.env.TERM == "xterm-kitty" then
	vim.cmd(
		[[autocmd UIEnter * if v:event.chan ==# 0 | call chansend(v:stderr, "\x1b[>1u") | endif]])
	vim.cmd(
		[[autocmd UILeave * if v:event.chan ==# 0 | call chansend(v:stderr, "\x1b[<1u") | endif]])
end
