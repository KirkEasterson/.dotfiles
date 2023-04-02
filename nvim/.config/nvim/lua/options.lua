vim.g.mapleader = ' ' -- prefix key
vim.g.maplocalleader = ' ' -- secondary prefix key

vim.opt.title = true

vim.opt.spell = true
vim.opt.spelllang = { 'en_us' }

vim.opt.updatetime = 750 -- fast updates
vim.opt.number = true -- show line numbers
vim.opt.relativenumber = true -- show relative line numbers
vim.opt.cursorline = true -- highlight the current line
vim.opt.termguicolors = true -- allow custom highlighting
vim.opt.incsearch = true -- highlight matches as you type
vim.opt.hlsearch = false -- unhighlight matches after searching
vim.opt.autoindent = true -- new lines inherit indenting
vim.opt.wrap = false -- don't wrap lines
vim.opt.linebreak = true -- if wrapping, wrap on complete words
vim.opt.breakindent = true -- preserve indenting on wrapped lines

vim.opt.visualbell = true

vim.opt.syntax = 'enable' -- show syntax highlighting
vim.opt.showmatch = true -- highlight matching brackets
vim.opt.scrolloff = 8 -- scroll when y away from vertical edge
vim.opt.sidescrolloff = 8 -- scroll when x away from horizontal edge
vim.opt.signcolumn = 'yes' -- column for linting
vim.opt.colorcolumn = '80' -- show line for 80char soft-limit

vim.opt.tabstop = 4 -- number of visual spaces per tab
vim.opt.softtabstop = 4 -- number of spaces in tab when editing
vim.opt.shiftwidth = 4 -- number of spaces when indenting with <>

vim.opt.mouse = 'a' -- enable mouse for scrolling and resizing
vim.opt.mousemodel = 'extend'
vim.opt.mousemoveevent = true

vim.opt.wildmenu = true -- visual autocompletion for command menu
vim.opt.wildmode = { 'longest', 'list', 'full' }

vim.opt.list = true
vim.opt.listchars:append({ lead = '·', trail = '▒', extends = '', precedes = '', tab = null })
vim.opt.fillchars:append({ eob = " ", fold = " ", foldopen = "󰅀", foldsep = " ", foldclose = "󰅂" })

vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true


vim.opt.swapfile = false -- don't create swap files

vim.opt.splitright = true --  splits open to the right
vim.opt.splitbelow = true --  splits open below

vim.opt.cmdheight = 0 -- hide the command line

vim.opt.confirm = true -- show confirm dialog when closing unsaved files

-- vim.opt.laststatus = 3 -- aesthetic win separators

-- vim.opt.lazyredraw = true -- redraw only when needed
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

vim.o.sessionoptions = "buffers,curdir,folds,tabpages,winsize,winpos,terminal,localoptions"

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

-- enable wrapping in specific files
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "markdown", "tex", "text" },
	callback = function()
		vim.opt_local.wrap = true
	end,
})


-- remove trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	command = [[%s/\s\+$//e]],
})

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 700,
		})
	end,
})

-- build notes files
vim.api.nvim_create_autocmd(
	'BufwritePost',
	{
		pattern = '*note-*.md',
		callback = 'silent! ~/scripts/build_notes.sh %:p',
	}
)

-- change indenting for js/ts files
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
	callback = function()
		vim.opt_local.expandtab = true
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
	end,
})

-- -- set fsharp file types
-- vim.api.nvim_create_autocmd(
-- 	{ 'BufNewFile', 'BufRead' },
-- 	{
-- 		pattern = '*.fs,*.fsx,*.fsi',
-- 		callback = 'set filetype=fsharp',
-- 	}
-- )

vim.api.nvim_create_autocmd("TermOpen", {
	callback = function()
		vim.opt_local.relativenumber = false
		vim.opt_local.number = false
		vim.cmd "startinsert!"
	end,
	desc = "start terminal in insert mode",
})

vim.api.nvim_create_autocmd(
	'FileType',
	{
		pattern = { 'gitcommit', 'gitrebase', },
		command = 'startinsert | 1',
		desc    = "start git messages in insert mode",
	}
)


vim.api.nvim_create_autocmd("VimResized", {
	callback = function()
		vim.cmd "wincmd ="
	end,
	desc = "Equalize Splits",
})

vim.api.nvim_create_autocmd(
	"User",
	{
		pattern = "AlphaReady",
		callback = function()
			vim.opt.cmdheight = 0
			vim.opt.showtabline = 0
			vim.opt.laststatus = 0

			vim.api.nvim_create_autocmd(
				"BufUnload",
				{
					pattern = "<buffer>",
					callback = function()
						vim.opt.cmdheight = 1
						vim.opt.showtabline = 2
						vim.opt.laststatus = 3
					end,
				}
			)
		end,
		desc = "Disable Bufferline And Lualine in Alpha",
	})

-- sync neovim with system clipboard
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	once = true,
	callback = function()
		require('kirk.utils.uname')
		if IS_LINUX or IS_WSL then
			if vim.fn.executable("xclip") == 1 then
				vim.g.clipboard = {
					copy = {
						["+"] = "xclip -selection clipboard",
						["*"] = "xclip -selection clipboard",
					},
					paste = {
						["+"] = "xclip -selection clipboard -o",
						["*"] = "xclip -selection clipboard -o",
					},
				}
			elseif vim.fn.executable("xsel") == 1 then
				vim.g.clipboard = {
					copy = {
						["+"] = "xsel --clipboard --input",
						["*"] = "xsel --clipboard --input",
					},
					paste = {
						["+"] = "xsel --clipboard --output",
						["*"] = "xsel --clipboard --output",
					},
				}
			end
		elseif IS_MAC then
			vim.g.clipboard = {
				copy = {
					["+"] = "pbcopy",
					["*"] = "pbcopy",
				},
				paste = {
					["+"] = "pbpaste",
					["*"] = "pbpaste",
				},
			}
		elseif IS_WINDOWS then
			vim.g.clipboard = {
				copy = {
					["+"] = "win32yank.exe -i --crlf",
					["*"] = "win32yank.exe -i --crlf",
				},
				paste = {
					["+"] = "win32yank.exe -o --lf",
					["*"] = "win32yank.exe -o --lf",
				},
			}
		end

		vim.opt.clipboard = "unnamedplus"
	end,
	desc = "Lazy load clipboard",
})
