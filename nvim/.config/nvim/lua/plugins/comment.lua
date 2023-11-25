return {
	'numToStr/Comment.nvim',
	version = "v0.*",
	cond = not vim.g.started_by_firenvim,
	dependencies = {
		'JoosepAlviste/nvim-ts-context-commentstring',
	},
	keys = {
		{ "gc" },
		{ "gb" },
		{
			"gcc",
			desc = "Toggle line comment",
		},
		{
			"gbc",
			desc = "Toggle block comment",
		},
		{
			"gcA",
			desc = "Add comment at end of line",
		},
		{
			"gco",
			desc = "Add comment below line",
		},
		{
			"gcO",
			desc = "Add comment above line",
		},
		{
			"gc",
			mode = "v",
			desc = "Toggle line comment",
		},
		{
			"gb",
			mode = "v",
			desc = "Toggle block comment",
		},
	},
	opts = {
		-- mappings = {
		-- 	basic = false,
		-- 	extra = false,
		-- },
		pre_hook = function()
			return vim.bo.commentstring
		end,
	},
}
