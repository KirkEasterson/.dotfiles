return {
	'javiorfo/nvim-soil',
	dependencies = {
		'javiorfo/nvim-nyctophilia',
	},
	version = "v0.1.*",
	ft = "plantuml",
	cmd = {
		"Soil",
		"SoilOpenImg",
	},
	keys = {
		{
			"<leader>pg",
			"<Cmd>Soil<CR>",
			desc = "Generate Plant UML diagram",
		},
	},
	opts = {
		image = {
			-- darkmode = true,
			format = "png", -- Choose between png or svg
		},
		execute_to_open = function(img)
			return "xdg-open " .. img
		end,
	},
}
