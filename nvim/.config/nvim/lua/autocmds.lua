local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, buffer = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- enable wrapping in specific files
autocmd({ "FileType" }, {
	pattern = { "markdown", "tex", "text" },
	callback = function()
		vim.opt_local.wrap = true

		-- easier undos
		map('i', ',', ',<c-g>u')
		map('i', '.', '.<c-g>u')
		map('i', '[', '[<c-g>u')
		map('i', '!', '!<c-g>u')
		map('i', '?', '?<c-g>u')
	end,
})

-- remove trailing whitespace on save
autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	callback = function ()
		if vim.bo.filetype == "markdown" then
			return
		end
		if not not vim.g.started_by_firenvim then
			return
		end
		vim.cmd([[%s/\s\+$//e]])
	end,
})

-- highlight yanked text
autocmd("TextYankPost", {
	group = augroup("highlight_yank", { clear = true }),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 700,
		})
	end,
})

-- build notes files
autocmd(
	'BufwritePost',
	{
		pattern = '*note-*.md',
		callback = 'silent! ~/scripts/build_notes.sh %:p',
	}
)

-- change indenting for js/ts files
autocmd({ "FileType" }, {
	pattern = {
		'javascript',
		'javascriptreact',
		'typescript',
		'typescriptreact',
		'markdown',
	},
	callback = function()
		vim.opt_local.expandtab = true
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
	end,
})

-- -- set fsharp file types
-- autocmd(
-- 	{ 'BufNewFile', 'BufRead' },
-- 	{
-- 		pattern = '*.fs,*.fsx,*.fsi',
-- 		callback = 'set filetype=fsharp',
-- 	}
-- )

autocmd("TermOpen", {
	callback = function()
		vim.opt_local.relativenumber = false
		vim.opt_local.number = false
		vim.cmd "startinsert!"
	end,
	desc = "start terminal in insert mode",
})

autocmd(
	'FileType',
	{
		pattern = { 'gitcommit', 'gitrebase', },
		command = 'startinsert | 1',
		desc    = "start git messages in insert mode",
	}
)

autocmd("VimResized", {
	callback = function()
		vim.cmd "wincmd ="
	end,
	desc = "Equalize Splits",
})

-- sync neovim with system clipboard
autocmd({ "BufReadPost", "BufNewFile" }, {
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
