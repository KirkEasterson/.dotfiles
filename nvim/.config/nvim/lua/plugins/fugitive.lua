return {
	'tpope/vim-fugitive',
	enabled = false,
	cmd = {
		"GBrowse",
		"GDelete",
		"GMove",
		"GRemove",
		"GRename",
		"Gdiffsplit",
		"Gedit",
		"Ggrep",
		"Git",
		"Gread",
		"Gsplit",
		"Gwrite",
	},
	keys = {
		{ "<leader>gg", "<Cmd>Git<CR>" }
	},
	config = false,
}
