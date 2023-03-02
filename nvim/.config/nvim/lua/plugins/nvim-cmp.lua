return {
	'hrsh7th/nvim-cmp',
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"onsails/lspkind.nvim",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-emoji",
		"hrsh7th/cmp-calc",
	},
	config = function()

		local cmp = require('cmp')

		local ok, lspkind = pcall(require, "lspkind")
		if not ok then
			return
		end

		lspkind.init()

		cmp.setup({
			mapping = {
				["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
				["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-e>"] = cmp.mapping.abort(),
				["<c-y>"] = cmp.mapping(
					cmp.mapping.confirm {
						behavior = cmp.ConfirmBehavior.Insert,
						select = true,
					},
					{
						"i",
						"c",
					}
				),
				["<c-space>"] = cmp.mapping {
					i = cmp.mapping.complete(),
					c = function(
					_ --[[fallback]]
					)
						if cmp.visible() then
							if not cmp.confirm { select = true } then
								return
							end
						else
							cmp.complete()
						end
					end,
				},
			},
			sources = cmp.config.sources({
				{ name = 'luasnip' },
				{ name = 'nvim_lsp' },
				{ name = 'path' },
				{ name = 'calc' },
				{ name = 'spell' },
				{ name = 'emoji' },
			}, {
				{ name = 'buffer' },
			}),
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end,
			},
			formatting = {
				format = lspkind.cmp_format {
					ellipsis_char = '…',
					with_text = true,
					menu = {
						buffer = "[buf]",
						gh_issues = "[issues]",
						luasnip = "[snip]",
						nvim_lsp = "[LSP]",
						nvim_lua = "[api]",
						path = "[path]",
						tn = "[TabNine]",
					},
				},
			},
			window = {
				completion = {
					border = 'rounded',
					scrollbar = '║',
				},
				documentation = {
					border = 'rounded',
					scrollbar = '║',
				},
			},

			experimental = {
				native_menu = false,
				ghost_text = true,
			},
		})

		-- -- insert `(` after select function or method item
		-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
		-- cmp.event:on(
		-- 	'confirm_done',
		-- 	cmp_autopairs.on_confirm_done()
		-- )
	end,
}
