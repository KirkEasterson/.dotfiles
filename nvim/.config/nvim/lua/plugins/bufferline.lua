return {
	'akinsho/bufferline.nvim',
	dependencies = {
		'neovim/nvim-lspconfig',
		'nvim-tree/nvim-web-devicons',
		'ellisonleao/gruvbox.nvim',
		'luisiacc/gruvbox-baby',
	},
	lazy = false,
	version = "v3.*",
	keys = {
		{ '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>' },
		{ '<Tab>', '<Cmd>BufferLineCycleNext<CR>' },
		{ '<A-1>', '<Cmd>BufferLineGoToBuffer 1<CR>' },
		{ '<A-2>', '<Cmd>BufferLineGoToBuffer 2<CR>' },
		{ '<A-3>', '<Cmd>BufferLineGoToBuffer 3<CR>' },
		{ '<A-4>', '<Cmd>BufferLineGoToBuffer 4<CR>' },
		{ '<A-5>', '<Cmd>BufferLineGoToBuffer 5<CR>' },
		{ '<A-6>', '<Cmd>BufferLineGoToBuffer 6<CR>' },
		{ '<A-7>', '<Cmd>BufferLineGoToBuffer 7<CR>' },
		{ '<A-8>', '<Cmd>BufferLineGoToBuffer 8<CR>' },
		{ '<A-9>', '<Cmd>BufferLineGoToBuffer 9<CR>' },
		{ '<A-0>', '<Cmd>BufferLineGoToBuffer 10<CR>' },
		{ '<A-<>', '<Cmd>BufferLineMovePrev<CR>' },
		{ '<A->>', '<Cmd>BufferLineMoveNext<CR>' },
	},
	config = function()
		vim.opt.termguicolors = true
		require('bufferline').setup({
			options = {
				right_mouse_command = "",
				middle_mouse_command = "bdelete! %d",
				separator_style = "slant",
				diagnostics = "nvim_lsp",
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "center",
						separator = true,
					},
				},
				numbers = function(opts)
					return opts.raise(opts.ordinal)
				end,
			},
		})
	end,
}
