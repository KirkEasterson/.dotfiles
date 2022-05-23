local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local s = ls.s
local i = ls.insert_node
local t = ls.text_node

ls.add_snippets("go", {
	s("fn", {
		t("func "),
		i(1),
		t("("),
		i(2),
		t(") "),
		i(3),
		t({"{", "\t"}),
		i(0),
		t({"", "}"}),
	}),
	s("err", {
		t({"if err != nil {", "\treturn "}),
		i(0),
		t({"", "}"})
	}),
})

-- ls.snippets = {
--
-- 	all = {
-- 		ls.parser.parse_snippet("expand", "-- this is what was expanded!"),
-- 	},
--
-- 	go = {
-- 		ls.parser.parse_snippet("mn", "package main\n\nfunc main() {\n\t$0\n}"),
-- 		ls.parser.parse_snippet("fn", "func $1($2) $3{\n\t$0\n}"),
-- 		ls.parser.parse_snippet("gfn", "go func() {\n\t$0\n}()"),
-- 		ls.parser.parse_snippet("test", "func $1(t *testing.T) {\n\twant := $2\n\tcontains := $3\n\n\tif want != contains {\n\t\tt.Fatalf(`$0`, contains, want)\n\t}\n}"),
-- 		ls.parser.parse_snippet("stru", "type $1 struct {\n\t$0\n}"),
-- 		ls.parser.parse_snippet("in", "type $1 interface {\n\t$0\n}"),
-- 		ls.parser.parse_snippet("err", "if err != nil {\n\t$0\n}"),
-- 		ls.parser.parse_snippet("for", "for {\n\t$0\n}"),
-- 		ls.parser.parse_snippet("forw", "for $1 {\n\t$0\n}"),
-- 		ls.parser.parse_snippet("fori", "for i := 0; i < $1; i++ {\n\t$0\n}"),
-- 		ls.parser.parse_snippet("mu", "mu sync.Mutex"),
-- 		ls.parser.parse_snippet("ch", "$1 := make(chan $0)"),
-- 		ls.parser.parse_snippet("pr", "fmt.Println($0)"),
-- 		ls.parser.parse_snippet("prf", "fmt.Printf($1, $0)"),
-- 		ls.parser.parse_snippet("wg", "var wg sync.WaitGroup"),
-- 	},
--
-- 	lua = {
-- 		ls.parser.parse_snippet("lf", "local $1 = function($2)\n\t$0\nend"),
-- 		ls.parser.parse_snippet("mf", "$1.$2 = function($3)\n\t$0\nend"),
-- 		s("req", fmt("local {} = require('{}')", { i(1, "default"), rep(1) })),
-- 	},
--
-- }

