return {
	'nvim-tree/nvim-tree.lua',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		'ellisonleao/gruvbox.nvim',
	},
	cmd = {
		'NvimTreeClipboard',
		'NvimTreeClose',
		'NvimTreeCollapse',
		'NvimTreeCollapseKeepBuffers',
		'NvimTreeFindFile',
		'NvimTreeFindFileToggle',
		'NvimTreeFocus',
		'NvimTreeGenerateOnAttach',
		'NvimTreeOpen',
		'NvimTreeRefresh',
		'NvimTreeResize',
		'NvimTreeToggle',
	},
	keys = {
		{
			'<leader>t',
			function() require('nvim-tree.api').tree.toggle() end,
			desc = "File tree",
		},
	},
	opts = {
		sort_by = "case_sensitive",
		sync_root_with_cwd = true,
		disable_netrw = true,
		update_focused_file = {
			enable = true,
		},
		view = {
			adaptive_size = true,
			side = "right",
			signcolumn = "no",
			number = true,
			relativenumber = true,
		},
		renderer = {
			add_trailing = true,
			highlight_git = true,
			highlight_modified = 'all',
			icons = {
				git_placement = 'after',
				modified_placement = 'after',
				show = {
					folder_arrow = false,
				},
			},
			indent_markers = {
				enable = true,
				icons = {
					corner = "└",
					edge = "│",
					item = "├",
					bottom = "─",
					none = " "
				},
			},
		},
		diagnostics = {
			enable = true,
			show_on_dirs = true,
		},
		git = {
			ignore = false,
		},
		actions = {
			change_dir = {
				enable = false,
			},
		},
	},
	config = function(_, opts)
		require('nvim-tree').setup(opts)
		local palette = require('gruvbox.palette')
		vim.cmd("highlight NvimTreeNormal guibg=" .. palette.colors.dark0_hard)
		vim.cmd("highlight NvimTreeWinSeparator guibg=" ..
			palette.colors.dark0_hard .. " guifg=" .. palette.colors.dark0_hard)
	end
}
