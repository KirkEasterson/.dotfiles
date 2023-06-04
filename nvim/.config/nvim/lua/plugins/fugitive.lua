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
		"Git_--paginate",
		"Git_blame",
		"Gread",
		"Gsplit",
		"Gvdiffsplit",
		"Gwrite",
	},
	keys = {
		{ "<leader>gg", "<Cmd>Git<CR>" }
	},
	config = false,
}
