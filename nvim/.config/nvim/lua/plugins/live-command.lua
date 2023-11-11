return {
	"smjonas/live-command.nvim",
	keys = {
		"V", -- visual-block mode
	},
	main = "live-command", -- lazy will try `live_command` which is wrong
	opts = {
		commands = {
			Norm = {
				cmd = "norm"
			},
		},
	},
}
