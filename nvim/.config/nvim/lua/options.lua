vim.g.mapleader = ' '      -- prefix key
vim.g.maplocalleader = ' ' -- secondary prefix key

vim.opt.title = true

vim.opt.spell = false
vim.opt.spelllang = { 'en_us' }

vim.opt.updatetime = 750      -- fast updates
vim.opt.number = true         -- show line numbers
vim.opt.relativenumber = true -- show relative line numbers
vim.opt.cursorline = true     -- highlight the current line
vim.opt.termguicolors = true  -- allow custom highlighting
vim.opt.incsearch = true      -- highlight matches as you type
vim.opt.hlsearch = false      -- unhighlight matches after searching
vim.opt.autoindent = true     -- new lines inherit indenting
vim.opt.wrap = false          -- don't wrap lines
vim.opt.linebreak = true      -- if wrapping, wrap on complete words
vim.opt.breakindent = true    -- preserve indenting on wrapped lines

vim.opt.visualbell = true

vim.opt.syntax = 'enable'  -- show syntax highlighting
vim.opt.showmatch = true   -- highlight matching brackets
vim.opt.scrolloff = 4      -- scroll when y away from vertical edge
vim.opt.sidescrolloff = 8  -- scroll when x away from horizontal edge
vim.opt.signcolumn = 'yes' -- column for linting
vim.opt.colorcolumn = '80' -- show line for 80char soft-limit

vim.opt.tabstop = 4        -- number of visual spaces per tab
vim.opt.softtabstop = 4    -- number of spaces in tab when editing
vim.opt.shiftwidth = 4     -- number of spaces when indenting with <>

vim.opt.mouse = 'a'        -- enable mouse for scrolling and resizing
vim.opt.mousemodel = 'extend'
vim.opt.mousehide = true
vim.opt.mousemoveevent = true
vim.opt.mousescroll = 'ver:1,hor:1'

vim.opt.wildmenu = true -- visual autocompletion for command menu
vim.opt.wildmode = { 'longest', 'list', 'full' }

vim.opt.list = true
vim.opt.listchars:append({
	lead = ' ',
	tab = '  ',
	trail = '▒',
	extends = '',
	precedes = '',
})
vim.opt.fillchars:append({
	eob = " ",
	fold = " ",
	foldopen = "󰅀",
	foldsep = " ",
	foldclose = "󰅂"
})



vim.opt.swapfile = false  -- don't create swap files

vim.opt.splitright = true --  splits open to the right
vim.opt.splitbelow = true --  splits open below

vim.opt.cmdheight = 0     -- hide the command line

vim.opt.confirm = true    -- show confirm dialog when closing unsaved files

vim.opt.laststatus = 3    -- aesthetic win separators

-- vim.opt.lazyredraw = true -- redraw only when needed
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }


vim.g.loaded_netrw = 1 -- disable netrw
vim.g.loaded_netrwPlugin = 1

if vim.g.neovide then
	vim.o.guifont = "ComicCodeLigatures Nerd Font"
	vim.g.neovide_refresh_rate = 120
	vim.g.neovide_refresh_rate_idle = 5
	vim.g.neovide_input_macos_alt_is_meta = true
end

-- require('statuscolumn')

if vim.env.TERM == 'xterm-kitty' then
	vim.cmd([[autocmd UIEnter * if v:event.chan ==# 0 | call chansend(v:stderr, "\x1b[>1u") | endif]])
	vim.cmd([[autocmd UILeave * if v:event.chan ==# 0 | call chansend(v:stderr, "\x1b[<1u") | endif]])
end

-- winbar -- use if not using barbecue.nvim
-- vim.cmd([[set winbar=%=%m\ %t%=]])
