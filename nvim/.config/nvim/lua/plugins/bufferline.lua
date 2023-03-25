return {
	'akinsho/bufferline.nvim',
	dependencies = {
		-- 'neovim/nvim-lspconfig',
		'nvim-tree/nvim-web-devicons',
		'ellisonleao/gruvbox.nvim',
		'luisiacc/gruvbox-baby',
	},
	event = "BufNew",
	version = "v3.5.*",
	keys = {
		{ '<S-Tab>', function() require('bufferline').cycle(-1) end },
		{ '<Tab>', function() require('bufferline').cycle(1) end },
		{ '<A-1>', function() require('bufferline').go_to_buffer(1, true) end },
		{ '<A-2>', function() require('bufferline').go_to_buffer(2, true) end },
		{ '<A-3>', function() require('bufferline').go_to_buffer(3, true) end },
		{ '<A-4>', function() require('bufferline').go_to_buffer(4, true) end },
		{ '<A-5>', function() require('bufferline').go_to_buffer(5, true) end },
		{ '<A-6>', function() require('bufferline').go_to_buffer(6, true) end },
		{ '<A-7>', function() require('bufferline').go_to_buffer(7, true) end },
		{ '<A-8>', function() require('bufferline').go_to_buffer(8, true) end },
		{ '<A-9>', function() require('bufferline').go_to_buffer(9, true) end },
		{ '<A-0>', function() require('bufferline').go_to_buffer(10, true) end },
		{ '<A-<>', function() require('bufferline').move(-1) end },
		{ '<A->>', function() require('bufferline').move(1) end },
	},
	opts = {
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
			hover = {
				enabled = true,
				delay = 10,
				reveal = { 'close' }
			},
			numbers = function(opts)
				return opts.raise(opts.ordinal)
			end,
		},
	}
}
