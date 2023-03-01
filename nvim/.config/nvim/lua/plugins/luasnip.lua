return {
	'L3MON4D3/LuaSnip',
	event = "InsertEnter",
	dependencies = { "rafamadriz/friendly-snippets" },
	config = function()
		local ls = require("luasnip")
		local types = require("luasnip.util.types")

		ls.config.set_config {
			history = true,
			updateevents = "TextChanged,TextChangedI",
			delete_check_events = "TextChanged,TextChangedI",
			enable_autosnippets = true,

			ext_opts = {
				[types.choiceNode] = {
					active = {
						virt_text = { { "<-", "Error" } },
					},
				},
			},
		}

		vim.keymap.set({ "i", "s" }, "<c-k>", function()
			if ls.expand_or_jumpable() then
				ls.expand_or_jump()
			end
		end, { silent = true })

		vim.keymap.set({ "i", "s" }, "<c-j>", function()
			if ls.jumpable(-1) then
				ls.jump(-1)
			end
		end, { silent = true })

		vim.keymap.set("i", "<c-l>", function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end)

		-- require("kirk.snippets.go")
	end,
}
