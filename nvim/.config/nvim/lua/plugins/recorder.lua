return {
	'chrisgrieser/nvim-recorder',
	dependencies = {
		'rcarriga/nvim-notify',
	},
	keys = {
		{ 'q', function() require('recorder').startStopRecording() end, mode = { 'n' } },
		{ 'Q', function() require('recorder').playMacro() end, mode = { 'n' } },
		{ '<C-q>', function() require('recorder').switchSlot() end, mode = { 'n' } },
		{ 'cq', function() require('recorder').editMacro() end, mode = { 'n' } },
	},
	opts = {
		lessNotifications = false,
	},
}
