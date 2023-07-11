return {
	'tpope/vim-fugitive',
	-- enabled = false,
	cmd = {
		"G",
		"GBrowse",
		"GDelete",
		"GMove",
		"GRemove",
		"GRename",
		"Gclog",
		"Gdiffsplit",
		"Gedit",
		"Ggrep",
		"Ghdiffsplit",
		"Git",
		"Gread",
		"Gsplit",
		"Gvdiffsplit",
		"Gwrite",
	},
	keys = {
		{
			"<leader>gg",
			"<Cmd>Git<CR>",
			desc = "Show git-fugitive UI",
		}
	},
	config = false,
}
