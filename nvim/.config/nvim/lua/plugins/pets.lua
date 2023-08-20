return {
	"giusgad/pets.nvim",
	cond = not vim.g.started_by_firenvim,
	dependencies = {
		"giusgad/hologram.nvim",
		"MunifTanjim/nui.nvim",
	},
	cmd = {
		"PetsNew",
		"PetsNewCustom",
		"PetsList",
		"PetsKill",
		"PetsKillAll",
		"PetsPauseToggle",
		"PetsHideToggle",
		"PetsSleepToggle",
	},
	keys = {
		{
			'<leader>pn',
			'<Cmd>PetsNew Peeve<CR>',
			desc = "Create new pet",
		},
		{
			'<leader>pk',
			'<Cmd>PetsKill Peeve<CR>',
			desc = "Kill pet",
		},
		{
			'<leader>pt',
			'<Cmd>PetsHideToggle<CR>',
			desc = "Hide pet",
		},
	},
	opts = {
		speed_multiplier = 2,
	},
}
