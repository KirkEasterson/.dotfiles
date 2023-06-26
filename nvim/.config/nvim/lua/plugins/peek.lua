return {
	'toppair/peek.nvim',
	enabled = false,
	build = 'deno task --quiet build:fast',
	keys = {
		{ "<leader>mdp", function() require('peek').open() end },
		{ "<leader>mds", function() require('peek').close() end },
		{ "<leader>mdt", function()
			if require('peek').is_open() then
				require('peek').close()
			else
				require('peek').open()
			end
		end },
	},
	opts = {},
}
