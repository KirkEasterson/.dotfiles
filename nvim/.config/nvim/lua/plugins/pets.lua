return {
	"giusgad/pets.nvim",
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
			'<leader>pt', '<Cmd>PetsHideToggle<CR>'
		},
	},
	config = {
		speed_multiplier = 2,
	},
}
