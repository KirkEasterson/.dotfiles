return {
	'hrsh7th/nvim-cmp',
	cond = not vim.g.started_by_firenvim,
	event = 'VimEnter',
	dependencies = {
		-- LSP Support
		{ 'neovim/nvim-lspconfig' },
		{ 'hrsh7th/cmp-nvim-lsp' },
		{ 'hrsh7th/cmp-buffer' },
		{ 'hrsh7th/cmp-path' },
		{ 'hrsh7th/cmp-cmdline' },
		{ 'FelipeLema/cmp-async-path' },

		{ "hrsh7th/cmp-emoji" },
		{ "hrsh7th/cmp-calc" },
		{ "petertriho/cmp-git" },

		{ 'hrsh7th/cmp-nvim-lua' },
		{ "onsails/lspkind.nvim" },
		{ "David-Kunz/cmp-npm" },
		{ "f3fora/cmp-spell" },

		-- Snippets
		{ 'L3MON4D3/LuaSnip' },
		{ 'saadparwaiz1/cmp_luasnip' },
		{ 'nvim-lua/plenary.nvim' },
		{ 'uga-rosa/cmp-dictionary' },

		-- Git
		{ 'davidsierradz/cmp-conventionalcommits' },
	},
	config = function(_, opts)
		local cmp = require('cmp')
		cmp.setup({
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
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
				{ name = 'npm',       ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'json', } },
				{ name = 'async_path' },
				{ name = 'calc' },
				{ name = 'spell',     ft = { 'text', 'markdown' } },
				{ name = 'emoji',     ft = { 'text', 'markdown' } },
				-- { name = 'copilot' },
				{ name = 'dictionary' },
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
				{ name = 'conventionalcommits' },
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
