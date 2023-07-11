return {
	'akinsho/bufferline.nvim',
	dependencies = {
		-- 'neovim/nvim-lspconfig',
		'nvim-tree/nvim-web-devicons',
		'ellisonleao/gruvbox.nvim',
		'luisiacc/gruvbox-baby',
	},
	event = 'VimEnter',
	version = "v4.*",
	keys = {
		{
			'<S-Tab>',
			function() require('bufferline').cycle(-1) end,
			desc = "Go to previous buffer",
		},
		{
			'<Tab>',
			function() require('bufferline').cycle(1) end,
			desc = "Go to next buffer",
		},
		{
			'<A-1>',
			function() require('bufferline').go_to_buffer(1, true) end,
			desc = "Go to buffer 1",
		},
		{
			'<A-2>',
			function() require('bufferline').go_to_buffer(2, true) end,
			desc = "Go to buffer 2",
		},
		{
			'<A-3>',
			function() require('bufferline').go_to_buffer(3, true) end,
			desc = "Go to buffer 3",
		},
		{
			'<A-4>',
			function() require('bufferline').go_to_buffer(4, true) end,
			desc = "Go to buffer 4",
		},
		{
			'<A-5>',
			function() require('bufferline').go_to_buffer(5, true) end,
			desc = "Go to buffer 5",
		},
		{
			'<A-6>',
			function() require('bufferline').go_to_buffer(6, true) end,
			desc = "Go to buffer 6",
		},
		{
			'<A-7>',
			function() require('bufferline').go_to_buffer(7, true) end,
			desc = "Go to buffer 7",
		},
		{
			'<A-8>',
			function() require('bufferline').go_to_buffer(8, true) end,
			desc = "Go to buffer 8",
		},
		{
			'<A-9>',
			function() require('bufferline').go_to_buffer(9, true) end,
			desc = "Go to buffer 9",
		},
		{
			'<A-0>',
			function() require('bufferline').go_to_buffer(10, true) end,
			desc = "Go to buffer 10",
		},
		{
			'<A-<>',
			function() require('bufferline').move(-1) end,
			desc = "Move buffer to the left",
		},
		{
			'<A->>',
			function() require('bufferline').move(1) end,
			desc = "Move buffer to the right",
		},
	},
	opts = {
		options = {
			right_mouse_command = "",
			middle_mouse_command = "bdelete! %d",
			separator_style = "thin",
			diagnostics = "nvim_lsp",
			offsets = {
				{
					filetype = "NvimTree",
					text = "Files",
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
	},
}
