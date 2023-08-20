return {
	"nvim-neorg/neorg",
	cond = not vim.g.started_by_firenvim,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-cmp",
	},
	cmd = {
		"Neorg",
	},
	ft = {
		"norg",
	},
	keys = {
		{
			"<leader>nd",
			"<Cmd>Neorg workspace notes<CR>",
			desc = "Open notes",
		},
		{ -- TODO: move this to only be in *.norg buffers
			"<leader>nr",
			"<Cmd>Neorg return<CR>",
			desc = "Close notes",
		},
		{ -- TODO: move this to only be in *.norg buffers
			"<leader>nt",
			"<Cmd>Neorg toggle-concealer<CR>",
			desc = "Toggle neorg concealer",
		},
		{
			"<leader>nn",
			"<Cmd>Neorg keybind norg core.dirman.new.note<CR>",
			desc = "Create new note",
		},
	},
	build = ":Neorg sync-parsers",
	opts = {
		load = {
			["core.defaults"] = {},
			["core.completion"] = {
				config = {
					engine = "nvim-cmp",
					name = "[Norg]",
				},
			},
			["core.integrations.nvim-cmp"] = {},
			["core.concealer"] = {},
			["core.export"] = {},
			["core.keybinds"] = {
				-- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
				config = {
					default_keybinds = true,
					neorg_leader = "<Leader><Leader>",
				},
			},
			["core.dirman"] = {
				config = {
					workspaces = {
						notes = "~/Documents/notes",
					},
					default_workspace = "notes",
				},
			},
			["core.qol.todo_items"] = {},
			["core.qol.toc"] = {
				config = {
					close_after_use = true
				},
			},
		},
	},
	init = function()
		vim.api.nvim_create_autocmd({ "FileType" }, {
			pattern = { 'norg' },
			callback = function()
				vim.opt_local.concealcursor = 'nvic' -- TODO: experiment to see if I don't need all modes
				vim.opt_local.conceallevel = 3

				-- TODO: figure out why the indenting still happens
				vim.opt_local.autoindent = false
				vim.opt_local.smartindent = false
				vim.opt_local.cindent = false
				vim.opt_local.expandtab = false
				vim.cmd [[filetype indent off]]
			end,
			desc = "Set conceal only for norg files",
		})
	end
}
