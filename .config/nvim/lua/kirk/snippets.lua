-- if vim.g.snippets ~= "luasnip" then
-- 	return
-- end

local ls = require "luasnip"
local types = require "luasnip.util.types"

ls.config.set_config {
	-- This	tells LuaSnip to remember to keep around the last snippet.
	-- You can jump back into it even if you move outside of the selection
	history = true,

	-- This one is cool cause if you have dynamic snippets, it updates as you type!
	updateevents = "TextChanged,TextChangedI",
	delete_check_events = "TextChanged,TextChangedI",

	-- Autosnippets:
	enable_autosnippets = true,

	-- Crazy highlights!
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "<-", "Error" } },
			},
		},
	},
}

-- MAPPINGS

-- <c-k> is my expansion key
-- this will expand the current item or jump to the next item within the snippet
vim.keymap.set({ "i", "s" }, "<c-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

-- <c-j> is my jump backwards key
-- this always moves to the previous item within the snippet
vim.keymap.set({ "i", "s" }, "<c-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })


-- <c-l> is selecting within a list of options.
-- This is useful for choice nodes
vim.keymap.set("i", "<c-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)

-- shortcut to source my luasnips file again, which will reload my snippets
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/kirk/snippets.lua<CR>")




-- SNIPPETS

-- This is a snipper creator
-- s(<trigger>, <nodes>)
local s = ls.s

-- This is a format node
-- It takes a format string, and a list of nodes
-- fmt(<fmt_string>, {...nodes})
local fmt = require("luasnip.extras.fmt").fmt

-- This is an insert node
-- It takes a position (like $1) and optionally some default test
-- i(<position>, [default_text])
local i = ls.insert_node

-- Repeats a node
-- rep(<position>)
local rep = require("luasnip.extras").rep

ls.snippets = {

	-- Available in any filetype
	all = {
		ls.parser.parse_snippet("expand", "-- this is what was expanded!"),
	},

	go = {
		ls.parser.parse_snippet("mn", "package main\n\nfunc main() {\n\t$0\n}"),
		ls.parser.parse_snippet("fn", "func $1($2) $3{\n\t$0\n}"),
		ls.parser.parse_snippet("gfn", "go func() {\n\t$0\n}()"),
		ls.parser.parse_snippet("test", "func $1(t *testing.T) {\n\twant := $2\n\tcontains := $3\n\n\tif want != contains {\n\t\tt.Fatalf(`$0`, contains, want)\n\t}\n}"),
		ls.parser.parse_snippet("stru", "type $1 struct {\n\t$0\n}"),
		ls.parser.parse_snippet("in", "type $1 interface {\n\t$0\n}"),
		ls.parser.parse_snippet("err", "if err != nil {\n\t$0\n}"),
		ls.parser.parse_snippet("for", "for {\n\t$0\n}"),
		ls.parser.parse_snippet("forw", "for $1 {\n\t$0\n}"),
		ls.parser.parse_snippet("fori", "for i := 0; i < $1; i++ {\n\t$0\n}"),
		ls.parser.parse_snippet("mu", "mu sync.Mutex"),
		ls.parser.parse_snippet("ch", "$1 := make(chan $0)"),
		ls.parser.parse_snippet("pr", "fmt.Println($0)"),
		ls.parser.parse_snippet("prf", "fmt.Printf($1, $0)"),
		ls.parser.parse_snippet("wg", "var wg sync.WaitGroup"),
	},

	-- Lua specific snippets
	lua = {
		-- local function
		ls.parser.parse_snippet("lf", "local $1 = function($2)\n\t$0\nend"),

		-- method function
		ls.parser.parse_snippet("mf", "$1.$2 = function($3)\n\t$0\nend"),

		s("req", fmt("local {} = require('{}')", { i(1, "default"), rep(1) })),
	},

}

