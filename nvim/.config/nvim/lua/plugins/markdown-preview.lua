return {
	"iamcco/markdown-preview.nvim",
	cond = not vim.g.started_by_firenvim,
	ft = {
		"markdown",
	},
	cmd = {
		"MarkdownPreview",
		"MarkdownPreviewStop",
		"MarkdownPreviewToggle",
	},
	keys = {
		{
			"<leader>mdp",
			"<Cmd>MarkdownPreview<CR>",
			desc = "Preview markdown",
		},
		{
			"<leader>mds",
			"<Cmd>MarkdownPreviewStop<CR>",
			desc = "Stop markdown preview",
		},
		{
			"<leader>mdt",
			"<Cmd>MarkdownPreviewToggle<CR>",
			desc = "Toggle markdown preview",
		},
	},
	build = function() vim.fn["mkdp#util#install"]() end,
	init = function()
		-- vim.api.nvim_set_var("mkdp_auto_start", 1)
		-- vim.api.nvim_set_var("mkdp_echo_preview_url", 1)
		vim.api.nvim_set_var("mkdp_auto_close", 0)
	end,
}
