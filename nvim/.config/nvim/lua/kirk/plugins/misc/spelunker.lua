return {
	'kamykn/spelunker.vim',
	ft = {
		"markdown",
		"text",
	},
	event = "FileReadPost",
	cmd = "SpelunkerAddAll",
	init = function()
		vim.api.nvim_set_var("enable_spelunker", 1)
		vim.api.nvim_set_var("enable_spelunker_vim_on_readonly ", 1)
		vim.api.nvim_set_var("spelunker_check_type", 2)
		vim.api.nvim_set_var("spelunker_highlight_type", 1)
		vim.api.nvim_set_var("spelunker_spell_bad_group", "SpelunkerSpellBad")
		vim.api.nvim_set_var("spelunker_complex_or_compound_word_group", "SpelunkerComplexOrCompoundWord")
		vim.cmd([[highlight SpelunkerSpellBad cterm=underline ctermfg=247 gui=undercurl guifg=NONE]])
		vim.cmd([[highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=NONE gui=undercurl guifg=NONE]])
	end,
}
