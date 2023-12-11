return {
	"nvim-tree/nvim-tree.lua",
	cond = not vim.g.started_by_firenvim,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	cmd = {
		"NvimTreeClipboard",
		"NvimTreeClose",
		"NvimTreeCollapse",
		"NvimTreeCollapseKeepBuffers",
		"NvimTreeFindFile",
		"NvimTreeFindFileToggle",
		"NvimTreeFocus",
		"NvimTreeGenerateOnAttach",
		"NvimTreeOpen",
		"NvimTreeRefresh",
		"NvimTreeResize",
		"NvimTreeToggle",
	},
	keys = {
		{
			"<leader>e",
			function()
				require("nvim-tree.api").tree.toggle()
			end,
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
			adaptive_size = false,
			side = "right",
			signcolumn = "yes",
			number = false,
			relativenumber = false,
		},
		renderer = {
			add_trailing = true,
			highlight_git = true,
			highlight_modified = "all",
			icons = {
				git_placement = "after",
				modified_placement = "after",
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
					none = " ",
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
		notify = {
			threshold = vim.log.levels.WARN,
		},
	},
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		vim.opt.termguicolors = true
	end,
}
