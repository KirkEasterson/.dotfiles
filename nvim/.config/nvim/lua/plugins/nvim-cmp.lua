return {
	'hrsh7th/nvim-cmp',
	cond = not vim.g.started_by_firenvim,
	event = "VeryLazy",
	dependencies = {
		-- LSP Support
		{ 'neovim/nvim-lspconfig' },
		{ 'hrsh7th/cmp-nvim-lsp' },
		{ 'hrsh7th/cmp-buffer' },
		{ 'hrsh7th/cmp-path' },
		{ 'hrsh7th/cmp-cmdline' },

		{ "hrsh7th/cmp-emoji" },
		{ "hrsh7th/cmp-calc" },
		{ "petertriho/cmp-git" },

		{ 'hrsh7th/cmp-nvim-lua' },
		{ "onsails/lspkind.nvim" },
		{ "David-Kunz/cmp-npm" },
		{ "f3fora/cmp-spell" },

		-- Snippets
		{ 'rafamadriz/friendly-snippets' },
		{ 'L3MON4D3/LuaSnip' },
		{ 'nvim-lua/plenary.nvim' },
	},
	config = function(_, opts)
		local cmp = require('cmp')
		cmp.setup({
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.abort(),
				['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
				{ name = 'npm',     ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'json', } },
				{ name = 'path' },
				{ name = 'calc' },
				{ name = 'spell',   ft = { 'text', 'markdown' } },
				{ name = 'emoji',   ft = { 'text', 'markdown' } },
				{ name = 'copilot' },
			}, {
				{ name = 'buffer' },
			}),
			experimental = {
				native_menu = false,
				ghost_text = true,
			},
		})

		cmp.setup.filetype('gitcommit', {
			sources = cmp.config.sources({
				{ name = 'git' },
				{ name = 'path' },
				{ name = 'calc' },
				{ name = 'spell' },
				{ name = 'emoji' },
			}, {
				{ name = 'buffer' },
			})
		})
	end,
}
