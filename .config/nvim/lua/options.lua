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

vim.cmd([[syntax enable]]) -- TODO: do this natively with lua
vim.opt.showmatch = true -- highlight matching brackets
vim.opt.scrolloff = 8 -- scroll when x away from edge
vim.opt.signcolumn = 'auto' -- column for linting
vim.opt.colorcolumn = '80' -- show line for 80char soft-limit

vim.opt.tabstop = 4 -- number of visual spaces per tab
vim.opt.softtabstop = 4 -- number of spaces in tab when editing
vim.opt.shiftwidth = 4 -- number of spaces when indenting with <>
vim.cmd([[filetype indent on]]) -- load filetype-specific indents

vim.opt.mouse = 'a' -- enable mouse for scrolling and resizing
vim.opt.mousemodel = 'extend'

vim.opt.wildmenu = true -- visual autocompletion for command menu
-- vim.cmd([[set clipboard+=namedplus]]) -- use system clipboard when yanking
vim.opt.clipboard:append('unnamedplus') -- use system clipboard when yanking

vim.opt.cmdheight = 0 -- hide the command line

vim.opt.laststatus = 3 -- aesthetic win separators
vim.cmd([[highlight WinSeparator guibg=None guifg=#928374]])

vim.opt.lazyredraw = true -- redraw only when needed
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- vim.opt.exrc = true -- use local vimrc if it exists

-- winbar
-- vim.opt.winbar = '%=%m\ %t%='
vim.cmd([[set winbar=%=%m\ %t%=]])
vim.cmd([[highlight WinBar guibg=#3c3836]])
vim.cmd([[highlight WinBarNC guibg=#282828]])

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

-- -- remove trailing whitespace on each save
-- vim.api.nvim_create_autocmd(
-- 	'BufWritePre',
-- 	{
-- 		pattern = '*',
-- 		callback = ":%s/\s\+$//e",
-- 	}
-- )

-- -- transparent background
-- vim.api.nvim_create_autocmd(
-- 	'ColorScheme',
-- 	{
-- 		pattern = "*",
-- 		callback = "highlight Normal ctermbg=none guibg=none",
-- 	}
-- )

-- build notes files
vim.api.nvim_create_autocmd(
	'BufwritePost',
	{
		pattern = '*note-*.md',
		callback = 'silent! ~/scripts/build_notes.sh %:p',
	}
)
