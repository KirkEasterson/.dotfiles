vim.g.mapleader = ' ' -- prefix key
vim.g.maplocalleader = ' ' -- secondary prefix key

vim.opt.updatetime = 50 -- fast updates
vim.opt.number = true -- show line numbers
vim.opt.relativenumber = true -- show relative line numbers
vim.opt.cursorline = true -- highlight the current line
vim.opt.termguicolors = true -- allow curtom highlighting
vim.opt.incsearch = true -- highlight matches as you type
vim.opt.hlsearch = false -- unhighlight matches after searching
vim.opt.autoindent = true -- new lines inherit indenting
vim.opt.wrap = false -- don't wrap lines
vim.opt.linebreak = true -- if wrapping, wrap on complete words
vim.opt.breakindent = true -- preserve indenting on wrapped lines

vim.opt.visualbell = true

vim.opt.syntax = 'enable' -- show syntax highlighting
vim.opt.showmatch = true -- highlight matching brackets
vim.opt.scrolloff = 4 -- scroll when y away from vertical edge
vim.opt.sidescroll = 4 -- scroll when x away from horizontal edge
vim.opt.signcolumn = 'yes' -- column for linting
vim.opt.colorcolumn = '80' -- show line for 80char soft-limit

vim.opt.tabstop = 4 -- number of visual spaces per tab
vim.opt.softtabstop = 4 -- number of spaces in tab when editing
vim.opt.shiftwidth = 4 -- number of spaces when indenting with <>
vim.cmd([[filetype indent on]]) -- load filetype-specific indents

vim.opt.mouse = 'a' -- enable mouse for scrolling and resizing
vim.opt.mousemodel = 'extend'

vim.opt.wildmenu = true -- visual autocompletion for command menu
vim.opt.wildmode = { 'longest', 'list', 'full' }
vim.opt.clipboard:append('unnamedplus') -- use system clipboard when yanking

vim.opt.swapfile = false -- don't create swap files

vim.opt.splitright = true --  splits open to the right
vim.opt.splitbelow = true --  splits open below

vim.opt.cmdheight = 0 -- hide the command line

vim.opt.confirm = true -- show confirm dialog when closing unsaved files

vim.opt.laststatus = 3 -- aesthetic win separators
vim.cmd([[highlight WinSeparator guibg=None guifg=#928374]])

vim.opt.lazyredraw = true -- redraw only when needed
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- enable wrapping in *.tex files
vim.cmd([[
	augroup WrapLineInLatexFile
		autocmd!
		autocmd FileType tex setlocal wrap
	augroup END
]])

-- enable wrapping in *.md files
vim.cmd([[
	augroup WrapLineInMarkdownFile
		autocmd!
		autocmd FileType markdown setlocal wrap
	augroup END
]])

-- remove trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	command = [[%s/\s\+$//e]],
})

-- highlight yanked text
local highlight_group = vim.api.nvim_create_augroup("highlight_yank", {
	clear = true
})
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 700,
		})
	end,
	group = highlight_group
})

-- build notes files
vim.api.nvim_create_autocmd(
	'BufwritePost',
	{
		pattern = '*note-*.md',
		callback = 'silent! ~/scripts/build_notes.sh %:p',
	}
)
