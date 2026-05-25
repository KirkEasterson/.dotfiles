local g = vim.g
local opt = vim.opt
local o = vim.o

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
	g["loaded_" .. v] = true
end

-- enable builtin plugins
local enabled_plugins = {
	"matchbracket",
	"matchparen",
}
for _, v in pairs(enabled_plugins) do
	g["loaded_" .. v] = false
end

opt.mousescroll = "ver:3,hor:3"

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
vim.api.nvim_set_hl(0, "SpellBad", { fg = nil, cterm = { undercurl = true } })
vim.api.nvim_set_hl(0, "SpellCap", { fg = nil, cterm = { undercurl = true } })
vim.api.nvim_set_hl(0, "SpellRare", { fg = nil, cterm = { undercurl = true } })
vim.api.nvim_set_hl(0, "SpellLocal", { fg = nil, cterm = { undercurl = true } })

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

opt.visualbell = false
opt.errorbells = true
opt.belloff = "esc"

opt.hidden = true -- Enable background buffers
opt.history = 100 -- Remember N lines in history
opt.lazyredraw = false
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
opt.fillchars:append({ eob = " " })

-- short messages
opt.shortmess:append("IWsA")

opt.swapfile = false -- don't create swap files
opt.autoread = true -- sync buffers automatically

opt.splitright = true --  splits open to the right
opt.splitbelow = true --  splits open below
opt.splitkeep = "topline" -- keep topline on split resizing

opt.undofile = true -- persistent undos
opt.confirm = true -- show confirm dialog when closing unsaved files

opt.laststatus = 3 -- aesthetic win separators

opt.completeopt = { "menu", "menuone", "noselect" }

opt.winborder = "rounded"

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
	opt.grepprg = "rg --vimgrep"
	opt.grepformat = "%f:%l:%c:%m"
end
