return {
	"pwntester/octo.nvim",
	cond = not vim.g.started_by_firenvim,
	cmd = "Octo",
	keys = {
		{
			"<leader>o",
			desc = "Octo",
		},

		-- PR
		{
			"<leader>op",
			desc = "Octo - PR",
		},
		{
			"<leader>opl",
			'<Cmd>Octo pr list<CR>',
			desc = "Octo - PR - list",
		},
		{
			"<leader>ops",
			'<Cmd>Octo pr search<CR>',
			desc = "Octo - PR - search",
		},
		{
			"<leader>opc",
			'<Cmd>Octo pr create<CR>',
			desc = "Octo - PR - create",
		},
		{
			"<leader>opo",
			'<Cmd>Octo pr checkout<CR>',
			desc = "Octo - PR - checkout",
		},
		{
			"<leader>opd",
			'<Cmd>Octo pr diff<CR>',
			desc = "Octo - PR - diff",
		},

		-- comment
		{
			"<leader>oc",
			desc = "Octo - comment",
		},
		{
			"<leader>oca",
			'<Cmd>Octo comment add<CR>',
			desc = "Octo - comment - add",
		},
		{
			"<leader>ocd",
			'<Cmd>Octo comment delete<CR>',
			desc = "Octo - comment - delete",
		},

		-- thread
		{
			"<leader>ot",
			desc = "Octo - thread",
		},
		{
			"<leader>otr",
			'<Cmd>Octo thread resolve<CR>',
			desc = "Octo - thread - resolve",
		},
		{
			"<leader>otu",
			'<Cmd>Octo thread unresolve<CR>',
			desc = "Octo - thread - unresolve",
		},

		-- review
		{
			"<leader>or",
			desc = "Octo - review",
		},
		{
			"<leader>ors",
			'<Cmd>Octo review start<CR>',
			desc = "Octo - review - start",
		},
		{
			"<leader>oru",
			'<Cmd>Octo review submit<CR>',
			desc = "Octo - review - submit",
		},
		{
			"<leader>orc",
			'<Cmd>Octo review close<CR>',
			desc = "Octo - review - close",
		},

		-- reaction
		{
			"<leader>oe",
			desc = "Octo - reaction",
		},
		{
			"<leader>oeu",
			'<Cmd>Octo reaction thumbs_up<CR>',
			desc = "Octo - reaction - 👍",
		},
		{
			"<leader>oed",
			'<Cmd>Octo reaction thumbs_down<CR>',
			desc = "Octo - reaction - 👎",
		},
		{
			"<leader>oee",
			'<Cmd>Octo reaction eyes<CR>',
			desc = "Octo - reaction - 👀",
		},
		{
			"<leader>oel",
			'<Cmd>Octo reaction laugh<CR>',
			desc = "Octo - reaction - 😄",
		},
		{
			"<leader>oec",
			'<Cmd>Octo reaction confused<CR>',
			desc = "Octo - reaction - 😕",
		},
		{
			"<leader>oer",
			'<Cmd>Octo reaction rocket<CR>',
			desc = "Octo - reaction - 🚀",
		},
		{
			"<leader>oeh",
			'<Cmd>Octo reaction heart<CR>',
			desc = "Octo - reaction - ❤️",
		},
		{
			"<leader>oet",
			'<Cmd>Octo reaction tada<CR>',
			desc = "Octo - reaction - 🎉",
		},

		-- misc
		{
			"<leader>oa",
			'<Cmd>Octo actions<CR>',
			desc = "Octo - actions",
		},
		{
			"<leader>os",
			'<Cmd>Octo search<CR>',
			desc = "Octo - search",
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		vim.treesitter.language.register("markdown", "octo")
	end,
	opts = {},
}
